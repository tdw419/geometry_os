#!/bin/bash
# Manual Alpine Installation with RAW disk (more reliable)
cd /home/jericho/zion/projects/geometry_os/geometry_os/conductor/tracks/shotcut-on-the-map/images

echo "Starting VM with RAW disk..."
echo "Connect: vncviewer localhost:5900"
echo ""
echo "After login as root, run: setup-alpine"
echo "When asked for disk, select: sda (not vda!)"
echo ""

qemu-system-x86_64 \
    -m 2048 \
    -smp 2 \
    -drive file=shotcut-alpine.raw,format=raw,if=ide \
    -cdrom alpine-virt-3.19.0-x86_64.iso \
    -boot d \
    -vnc 127.0.0.1:0 \
    -netdev user,id=net0,hostfwd=tcp::2223-:22 \
    -device virtio-net-pci,netdev=net0 \
    -enable-kvm

echo ""
echo "VM shutdown. Disk size:"
ls -la shotcut-alpine.raw
