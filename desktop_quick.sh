#!/bin/bash
# Quick Ubuntu RISC-V desktop launcher

echo "Ubuntu Desktop - connect with: vncviewer localhost:5900"

killall -9 qemu-system-riscv64 geometry_os 2>/dev/null
sleep 2
rm -f /tmp/geo_cmd.sock

./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
sleep 2

echo "Booting..."
DISK="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK" | nc -U /tmp/geo_cmd.sock

echo "Waiting 40s for boot & login..."
sleep 40

echo "Login & starting desktop..."
echo "hypervisor_input root" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input startx &" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 5

echo ""
echo "✓ Desktop running! Connect with: vncviewer localhost:5900"
echo ""
echo "To send commands via serial:"
echo "  echo 'command' | nc -U /tmp/geo_cmd.sock"
echo ""
echo "Press Ctrl+C to stop VM"
echo ""

wait