# Hardware Test Guide

## ISO Ready

```
File: geometry_os.iso
Size: 12MB
SHA256: c75e93df631c8a4c035e0c8ec5d129a7e255b7883903a02fabface1f7dad60e8
```

## Requirements

- **CPU:** x86_64 (Intel/AMD with 64-bit support)
- **GPU:** Intel integrated graphics (Gen9+ recommended)
  - Tested: Skylake, Kaby Lake, Coffee Lake, Tiger Lake
  - May work: Haswell, Broadwell (Gen7.5, Gen8)
- **RAM:** 256MB minimum
- **Display:** Connected to Intel GPU output

## Create Bootable USB

```bash
# Find USB device
lsblk -d -o NAME,SIZE,MODEL | grep -v loop

# Write ISO (WARNING: erases USB!)
sudo dd if=geometry_os.iso of=/dev/sdX bs=4M status=progress && sync
```

## Boot Sequence

1. Insert USB into Intel GPU machine
2. Power on, enter boot menu (F12, F8, or F2)
3. Select USB drive
4. Watch output:
   - **Screen:** Bouncing color ball animation
   - **Serial (optional):** Debug messages at 38400 8N1

## Expected Output (Intel GPU)

```
[INFO] Initializing GPU...
[OK] Intel GPU found (vendor 0x8086, device 0x3E9B)
[OK] GPU MMIO initialized
[OK] GPU forcewake acquired
[OK] Ring buffer initialized
  RCS: available
  BCS: available
```

## Troubleshooting

| Issue | Cause | Fix |
|-------|-------|-----|
| No display | Wrong GPU output | Try different HDMI/DP port |
| Black screen | Framebuffer not mapped | Check serial output |
| Reboots loop | Triple fault | Report with serial log |
| No Intel GPU | AMD/NVIDIA system | Use QEMU for testing |

## Serial Debug (Optional)

Connect serial cable to COM1:
- Baud: 38400
- Data: 8 bits
- Parity: None
- Stop: 1 bit

```bash
# Linux
sudo screen /dev/ttyUSB0 38400

# Or
sudo minicom -D /dev/ttyUSB0
```

## What to Report

If testing on real hardware, capture:
1. Full serial output
2. GPU device ID (from "Intel GPU found" line)
3. Any errors or unexpected behavior
4. Whether animation appears on screen

---

*ISO built: 2026-03-13*
