#!/bin/bash
echo "=========================================="
echo "Ubuntu - VNC with Console (Direct QEMU)"
echo "=========================================="
echo ""

killall -9 qemu-system-riscv64 2>/dev/null
sleep 2

DISK="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "Booting with VNC..."
qemu-system-riscv64 \
  -machine virt \
  -m 2G \
  -smp 2 \
  -kernel "$KERNEL" \
  -append "console=tty0 earlyprintk=virtio video=1024x768 root=/dev/vda rw quiet" \
  -drive file="$DISK",format=raw,if=virtio \
  -device virtio-gpu-pci,xres=1024,yres=768 \
  -device virtio-keyboard-pci \
  -device virtio-mouse-pci \
  -display vnc=:0 &

QEMU_PID=$!
sleep 5

if ! kill -0 $QEMU_PID 2>/dev/null; then
    echo "✗ QEMU failed to start"
    exit 1
fi

echo ""
echo "✓ QEMU running (PID: $QEMU_PID)"
echo "✓ VNC on port 5900"
echo ""
echo "The framebuffer console should NOW be visible on VNC!"
echo ""
echo "Connect with: vncviewer localhost:5900"
echo ""
echo "To stop: kill $QEMU_PID"
echo ""

wait $QEMU_PID