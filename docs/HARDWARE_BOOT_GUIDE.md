# Geometry OS - Hardware Boot Guide

## Prerequisites

- AMD GPU (RX 5000/6000/7000 series recommended)
- USB drive (at least 128MB)
- System with UEFI boot support

## Step 1: Verify Boot Image

```bash
# Check boot image exists
ls -lh kernel/boot/geometry_os_boot.img
# Should show: 64M boot image

# Verify image structure
fdisk -l kernel/boot/geometry_os_boot.img
```

## Step 2: Flash to USB Drive

```bash
# Insert USB drive and identify device
lsblk
# Note the device (e.g., /dev/sdb)

# Flash the boot image (DANGEROUS - double-check device!)
sudo dd if=kernel/boot/geometry_os_boot.img of=/dev/sdX bs=4M status=progress conv=fsync
# Replace /dev/sdX with your USB device

# Sync and eject
sync
sudo eject /dev/sdX
```

## Step 3: Boot from USB

1. Insert USB into target machine with AMD GPU
2. Enter BIOS/UEFI setup (usually F2, F12, or Del)
3. Disable Secure Boot
4. Set boot mode to UEFI
5. Select USB drive as boot device
6. Save and exit

## Step 4: Expected Boot Sequence

```
UEFI → BOOTX64.EFI → geometry_os.kernel → GPU MMIO → Glyph VM
```

Serial output will show:
```
[GEOS] UEFI Bootloader initialized
[GEOS] Found GPU on PCI bus
[GEOS] Mapped GPU MMIO region
[GEOS] Loading kernel...
[GEOS] Loading window_manager.rts.png...
[GEOS] Loading glyph_microcode.spv...
[GEOS] Exiting boot services
[GEOS] Kernel entry point reached
[GEOS] GPU compute rings initialized
[GEOS] Window Manager VM #0 started
```

## Step 5: Verify with Spatial Debugger

On a separate machine, connect to the running VM:

```python
import geos
status = geos.geos_status()
print(status)
```

## QEMU Pre-Flight Test

Before physical boot, test in QEMU:

```bash
cd kernel/boot
./run_bare_metal.sh

# Check serial output
tail -f /tmp/serial.log
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| No boot device shown | Verify GPT partition, check USB format |
| Black screen after UEFI | Check kernel serial output |
| GPU not detected | Verify AMD GPU, check PCI enumeration |
| MMIO mapping failed | GPU may not support required regions |

## Recovery

If boot fails, the system will halt. Simply power off and remove USB.
No permanent changes are made to the system.
