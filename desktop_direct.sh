#!/bin/bash
# Ubuntu Desktop Launcher - Direct kernel boot (working solution)

echo "=========================================="
echo "Ubuntu Desktop (Direct Boot + VNC)"
echo "=========================================="
echo ""

# Cleanup
killall -9 qemu-system-riscv64 geometry_os 2>/dev/null
sleep 2
rm -f /tmp/geo_cmd.sock /tmp/geos_output.log

DISK="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"

# Boot with direct QEMU command (proven working)
echo "[1/3] Booting Ubuntu with direct QEMU..."
qemu-system-riscv64 \
  -machine virt \
  -m 2G \
  -smp 2 \
  -kernel "$KERNEL" \
  -append "console=ttyS0 root=/dev/vda rw quiet splash" \
  -drive file="$DISK",format=raw,if=virtio \
  -device virtio-gpu-pci \
  -device virtio-keyboard-pci \
  -display vnc=:0 \
  -serial mon:stdio &

QEMU_PID=$!
sleep 5

if ! kill -0 $QEMU_PID 2>/dev/null; then
    echo "✗ QEMU failed to start"
    exit 1
fi

echo "[2/3] Waiting for boot (~50s)..."
sleep 50

echo "[3/3] Starting X11 desktop..."
# Send commands via serial (stdin to QEMU)
echo -e "root\n" > /proc/$QEMU_PID/fd/0 2>/dev/null
sleep 2
echo -e "export DISPLAY=:0\n" > /proc/$QEMU_PID/fd/0 2>/dev/null
sleep 1
echo -e "startx 2>&1 &\n" > /proc/$QEMU_PID/fd/0 2>/dev/null
sleep 5

echo ""
echo "✓ Desktop running!"
echo ""
echo "Connect with: vncviewer localhost:5900"
echo ""
echo "Press Ctrl+C to stop"
echo ""

wait $QEMU_PID