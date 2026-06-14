# Memory Palace Linux

A standalone RISC-V Linux distribution that boots from a **single PNG file**.

## Overview

Memory Palace Linux is an experimental Linux distribution that leverages the Memory Palace spatial computing paradigm. Instead of traditional tarballs or container images, the entire OS (kernel, initramfs, device tree, boot parameters) is encoded in a PNG image file.

### Why PNG?

- **Spatial storage**: OS components stored in pixel metadata
- **Visualizable**: You can literally see your operating system
- **Version-control friendly**: Git can track your OS as an image
- **Novel distribution**: "Boot from an image" - unique in the Linux world
- **Memory Palace native**: Integrates with spatial computing platform

### What's Inside

```
ubuntu_palace_working.png (27M)
├── Kernel: Image (22M) - Linux 6.14.0 RISC-V
├── Initramfs: initramfs.cpio.gz (717B) - minimal /init
├── DTB: qemu-virt.dtb (1.6K) - QEMU virt machine
└── Cmdline: console=ttyS0 earlycon=sbi
```

## Quick Start

### Boot from PNG (Recommended)

```bash
python3 palace_boot.py ubuntu_palace_working.png
```

This extracts components from the PNG and boots via QEMU.

### Boot from ISO (Convenience Format)

```bash
# Generate ISO from PNG (one-time)
python3 palace_to_iso.py ubuntu_palace_working.png memory_palace_linux.iso

# Boot from extracted ISO components
cd iso_test  # or extract ISO with xorriso
qemu-system-riscv64 -nographic -machine virt -m 1G -smp 2 \
  -kernel boot/Image -initrd boot/initramfs.cpio.gz \
  -dtb boot/qemu-virt.dtb -append "console=ttyS0 earlycon=sbi" \
  -bios default
```

**Note**: ISO is generated from PNG. PNG remains the canonical format.

## System Requirements

### QEMU Boot (Current)
- QEMU with RISC-V support
- Linux/macOS/Windows host
- ~1GB RAM

### Hardware Boot (Future)
- RISC-V hardware (e.g., SiFive HiFive Unmatched)
- UEFI firmware with RISC-V GRUB support
- Serial console at 115200 baud

## Build Your Own

### Prerequisites

```bash
# RISC-V toolchain
sudo apt install gcc-riscv64-linux-gnu

# RISC-V kernel build deps
sudo apt install bc bison flex libssl-dev libncurses-dev

# Pixelpack (PNG encoder)
cd ~/projects/zion/projects/pixelpack && cargo build --release
```

### Build Kernel

```bash
# Configure for RISC-V
make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- defconfig

# Build kernel
make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- -j$(nproc)
```

### Create PNG Distribution

```bash
# Package into Memory Palace PNG
# (See packaging scripts in this repository)
python3 package_to_png.py Image initramfs.cpio.gz qemu-virt.dtb
```

## Architecture

```
┌─────────────────────────────────────┐
│   Memory Palace PNG (27M)           │
│  ┌─────────────────────────────┐   │
│  │ Pixel Metadata (SPBF)       │   │
│  │ ├─ Ring 1, Angle 0: Kernel │   │
│  │ ├─ Ring 1, Angle 1: Initrd │   │
│  │ ├─ Ring 1, Angle 2: DTB    │   │
│  │ └─ Ring 1, Angle 3: Cmdline│   │
│  └─────────────────────────────┘   │
└─────────────────────────────────────┘
              ↓
┌─────────────────────────────────────┐
│   palace_boot.py (Extractor)       │
│   → pixelpack decode               │
│   → Extract components             │
└─────────────────────────────────────┘
              ↓
┌─────────────────────────────────────┐
│   QEMU System RISC-V               │
│   ├── OpenSBI (firmware)           │
│   ├── Linux 6.14.0 (kernel)        │
│   └── Init process (/init)         │
└─────────────────────────────────────┘
```

## Components

### Kernel
- **Version**: Linux 6.14.0
- **Arch**: RISC-V 64-bit
- **Config**: QEMU virt machine
- **Console**: ttyS0 @ 0x10000000 (115200 baud)

### Initramfs
- **Format**: CPIO + gzip
- **Init**: Minimal `/init` shell script
- **Size**: 717 bytes (ultra-minimal)

### Device Tree
- **Platform**: QEMU virt (riscv-virtio,qemu)
- **UART**: 16550A @ 0x10000000
- **PLIC**: @ 0xc000000 (53 interrupts)
- **Memory**: 1GB @ 0x80000000

## Known Issues

1. **Hardware Boot**: ISO structure ready, but needs `grub-riscv64.efi` bootloader for real hardware
2. **CPU SMP**: CPU1 fails to start (QEMU virt limitation, not OS bug)
3. **Initramfs**: Currently minimal - expand for full system

## Roadmap

- [ ] Add full userspace (busybox, toybox, or glibc)
- [ ] Build grub-riscv64.efi for hardware boot
- [ ] Add VirtIO drivers for network/storage
- [ ] Create multiple PNG variants (minimal, dev, full)
- [ ] Integrate Memory Palace persistence module
- [ ] Add Geometry OS native apps

## Contributing

This is an experimental project exploring spatial computing concepts.

## License

Linux kernel: GPL v2
Scripts: MIT
Concept: Spatial Computing Paradigm

## Credits

- **Concept**: Memory Palace spatial computing platform
- **Kernel**: Linux RISC-V port
- **Boot**: OpenSBI firmware
- **Encoding**: Pixelpack spatial byte format

---

**Remember**: The PNG is the real OS. ISO is just a convenience wrapper.

```bash
# The canonical way to boot Memory Palace Linux:
python3 palace_boot.py ubuntu_palace_working.png
```