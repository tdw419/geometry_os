#!/bin/bash
# Start QEMU with Alpine for installation
# Serial console on pty for automation

IMAGE="conductor/tracks/shotcut-on-the-map/images/shotcut-alpine.qcow2"
ISO="conductor/tracks/shotcut-on-the-map/images/alpine-virt-3.19.0-x86_64.iso"

# Create disk if needed
if [ ! -f "$IMAGE" ]; then
    qemu-img create -f qcow2 "$IMAGE" 8G
fi

# Start QEMU
# -serial pty creates a pseudo-terminal we can connect to
# -nographic disables graphical output (we only need serial)
exec qemu-system-x86_64 \
    -m 2048 \
    -smp 2 \
    -drive file="$IMAGE",format=qcow2,if=virtio \
    -cdrom "$ISO" \
    -boot d \
    -serial pty \
    -monitor unix:/tmp/qemu-monitor.sock,server,nowait \
    -netdev user,id=net0,hostfwd=tcp::2222-:22 \
    -device virtio-net-pci,netdev=net0 \
    -enable-kvm \
    -nographic
