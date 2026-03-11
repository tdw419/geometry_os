#!/bin/bash
# Manual Alpine Installation - Run this script and connect with: vncviewer localhost:5900
# Installation answers: us, us, shotcut-vm, eth0 (enter), dhcp (enter), n (enter),
#                       root, root, UTC, none (enter), 1, openssh, chrony, vda, sys, y

cd /home/jericho/zion/projects/geometry_os/geometry_os/conductor/tracks/shotcut-on-the-map/images

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

echo "VM has shut down. Check if installation completed:"
ls -la shotcut-alpine.qcow2
