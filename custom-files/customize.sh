#!/bin/sh
# 修改默认 IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 设置 root 默认密码为 password
PASSWD=$(openssl passwd -1 "password")
sed -i "s#root::0:0:99999:7:::#root:${PASSWD}:0:0:99999:7:::#" package/base-files/files/etc/shadow

# 更改 banner（登录后台左上角、SSH 欢迎界面显示）
sed -i "s/'OpenWrt'/'R2S Plus'/g" package/base-files/files/etc/banner
