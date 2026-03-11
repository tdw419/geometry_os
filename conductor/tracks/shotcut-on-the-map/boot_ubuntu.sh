#!/bin/bash
# Boot Ubuntu Desktop for Shotcut installation
UBUNTU_IMG="/home/jericho/zion/projects/geometry_os/geometry_os/apps/linux/ubuntu-24.04-desktop.qcow2"

echo "Booting Ubuntu Desktop..."
echo "Connect: vncviewer localhost:5900"
echo ""
echo "Login credentials (if needed):"
echo "  User: ubuntu"
echo "  Pass: ubuntu"
echo ""

qemu-system-x86_64 \
    -m 4096 \
    -smp 4 \
    -drive file=$UBUNTU_IMG,format=qcow2,if=virtio \
    -vnc 127.0.0.1:0 \
    -netdev user,id=net0,hostfwd=tcp::2222-:22 \
    -device virtio-net-pci,netdev=net0 \
    -device qxl-vga,vgamem_mb=128 \
    -enable-kvm \
    -cpu host

echo "VM shutdown."
