#!/bin/bash
# Check disk and retry installation
cd /home/jericho/zion/projects/geometry_os/geometry_os/conductor/tracks/shotcut-on-the-map/images

echo "Current disk size:"
ls -la shotcut-alpine.qcow2

echo ""
echo "Starting VM with ISO to check disk..."
qemu-system-x86_64 \
    -m 2048 \
    -smp 2 \
    -drive file=shotcut-alpine.qcow2,format=qcow2,if=virtio \
    -cdrom alpine-virt-3.19.0-x86_64.iso \
    -boot d \
    -vnc 127.0.0.1:0 \
    -netdev user,id=net0,hostfwd=tcp::2223-:22 \
    -device virtio-net-pci,netdev=net0 \
    -device qxl-vga,vgamem_mb=64 \
    -enable-kvm

echo ""
echo "VM shutdown. Final disk size:"
ls -la shotcut-alpine.qcow2
