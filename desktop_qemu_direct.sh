#!/bin/bash
echo "=========================================="
echo "Ubuntu Desktop - Direct QEMU VNC"
echo "=========================================="
echo ""

killall -9 qemu-system-riscv64 2>/dev/null
sleep 2

DISK="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "Booting with direct QEMU (no bios)..."
qemu-system-riscv64 \
  -machine virt \
  -m 2G \
  -smp 2 \
  -kernel "$KERNEL" \
  -append "console=ttyS0 root=/dev/vda rw quiet splash video=vesafb:ywrap,mtrr:3 vga=791" \
  -drive file="$DISK",format=raw,if=virtio \
  -device virtio-gpu-pci \
  -device virtio-keyboard-pci \
  -display vnc=:0 \
  -serial mon:stdio &

QEMU_PID=$!
sleep 5

echo ""
echo "VM PID: $QEMU_PID"
echo "VNC: localhost:5900"
echo ""
echo "Waiting 50s for boot..."
sleep 50

echo ""
echo "Sending commands to start X11..."
# Can't send input directly to QEMU stdin with -serial mon:stdio
# Need to use monitor or expect script

echo ""
echo "System is running. Connect with: vncviewer localhost:5900"
echo "To stop: kill $QEMU_PID"
echo ""

wait $QEMU_PID