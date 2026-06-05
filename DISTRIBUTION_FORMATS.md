# Distribution Formats - Memory Palace Linux

## Overview

Memory Palace Linux is distributed in **two complementary formats**:

1. **PNG** (Canonical) - Native Memory Palace format
2. **ISO** (Generated) - Convenience distribution format

Both formats boot the same operating system, but serve different purposes.

---

## PNG Format (Canonical)

### Characteristics
- **Size**: ~27MB
- **Format**: PNG image with embedded pixel metadata
- **Components**: Encoded in SPBF (Spatial Pixel Byte Format)
- **Status**: **Primary** - This is the real OS
- **Workflow**: Edit PNG → Test → Ship

### What's Inside
```
ubuntu_palace_working.png (27M PNG)
├── Kernel: Image (22M) - Linux 6.14.0 RISC-V
├── Initramfs: initramfs.cpio.gz (717B)
├── DTB: qemu-virt.dtb (1.6K)
└── Cmdline: console=ttyS0 earlycon=sbi
```

### Advantages
✅ **Spatial Storage** - OS components in pixel metadata
✅ **Visualizable** - You can literally see your OS
✅ **Git-Friendly** - Track OS like any image file
✅ **Novel** - First Linux distribution bootable from PNG
✅ **Native** - Memory Palace spatial computing paradigm

### Usage
```bash
python3 palace_boot.py ubuntu_palace_working.png
```

---

## ISO Format (Generated)

### Characteristics
- **Size**: ~22MB
- **Format**: ISO 9660 filesystem
- **Components**: Extracted from PNG
- **Status**: **Derived** - Auto-generated from PNG
- **Workflow**: PNG → ISO (automatic)

### What's Inside
```
memory_palace_linux.iso (22M ISO)
├── boot/
│   ├── Image (22M) - Kernel
│   ├── initramfs.cpio.gz (717B)
│   └── qemu-virt.dtb (1.6K)
├── EFI/BOOT/
│   └── grub.cfg - Boot configuration
├── palace_boot.py - PNG boot script
└── boot_iso.sh - QEMU boot helper
```

### Advantages
✅ **Standard** - Traditional ISO format
✅ **Convenience** - Easier for traditional Linux users
✅ **Distribution** - Well-understood format
✅ **Hardware Ready** - Structure ready for GRUB bootloader

### Usage
```bash
# Generate from PNG
python3 palace_to_iso.py ubuntu_palace_working.png memory_palace_linux.iso

# Extract and boot
mkdir iso_extract
xorriso -osirrox on -indev memory_palace_linux.iso -extract / iso_extract/
cd iso_extract
qemu-system-riscv64 -nographic -machine virt -m 1G -smp 2 \
  -kernel boot/Image -initrd boot/initramfs.cpio.gz \
  -dtb boot/qemu-virt.dtb -append "console=ttyS0 earlycon=sbi" \
  -bios default
```

---

## Format Comparison

| Aspect | PNG | ISO |
|--------|-----|-----|
| **Type** | Canonical | Generated |
| **Size** | 27M | 22M |
| **Format** | PNG + SPBF | ISO 9660 |
| **Source** | Handcrafted | Auto-extracted |
| **Visualizable** | ✅ Yes | ❌ No |
| **Git-Friendly** | ✅ Yes | ❌ No |
| **Standard** | ❌ Novel | ✅ Traditional |
| **Boot Method** | palace_boot.py | QEMU direct / GRUB |
| **Distribution** | Novel | Conventional |
| **Hardware Support** | Via ISO | Direct (with GRUB) |

---

## Development Workflow

### 1. Create/Modify OS
```bash
# Build kernel, initramfs, DTB
make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- -j$(nproc)
```

### 2. Package into PNG
```bash
python3 package_to_png.py Image initramfs.cpio.gz qemu-virt.dtb
```

### 3. Test PNG Boot
```bash
python3 palace_boot.py ubuntu_palace_working.png
```

### 4. Generate ISO (Optional)
```bash
python3 palace_to_iso.py ubuntu_palace_working.png memory_palace_linux.iso
```

### 5. Verify ISO Boot
```bash
# Extract ISO
xorriso -osirrox on -indev memory_palace_linux.iso -extract / iso_test/

# Boot from extracted components
cd iso_test
qemu-system-riscv64 -nographic -machine virt -m 1G -smp 2 \
  -kernel boot/Image -initrd boot/initramfs.cpio.gz \
  -dtb boot/qemu-virt.dtb -append "console=ttyS0 earlycon=sbi" \
  -bios default
```

### 6. Ship Both
```bash
git add ubuntu_palace_working.png memory_palace_linux.iso
git commit -m "Release Memory Palace Linux vX"
git push origin main
```

---

## Distribution Strategy

### Primary: PNG
- **Target**: Memory Palace ecosystem users
- **Use Case**: Spatial computing, version tracking, novel distribution
- **Delivery**: Direct download, git clone
- **Documentation**: palace_boot.py, README.md

### Secondary: ISO
- **Target**: Traditional Linux users
- **Use Case**: Standard boot process, hardware deployment
- **Delivery**: Standard ISO distribution
- **Documentation**: ISO_BOOT_VERIFICATION.md

---

## Future Directions

### Hardware Boot Support
```bash
# Build GRUB for RISC-V
sudo apt install grub-riscv64-efi

# Add to ISO structure
grub-mkrescue -o memory_palace_linux.iso iso_root/
```

### Multiple Variants
```
ubuntu_palace_minimal.png    (~15M) - Kernel + init only
ubuntu_palace_dev.png        (~50M) - + dev tools
ubuntu_palace_full.png       (~100M) - + userspace
```

### Compression
- Explore PNG compression strategies
- Consider alternative spatial formats
- Optimize SPBF encoding efficiency

---

## Golden Rule

**PNG is the real operating system. ISO is just a convenience wrapper.**

Always:
1. Edit PNG components
2. Test PNG boot
3. Regenerate ISO
4. Ship both

Never:
1. Edit ISO directly
2. Modify extracted components
3. Treat ISO as source of truth

---

## Summary

Memory Palace Linux represents a paradigm shift in OS distribution:
- **PNG** = Novel, spatial, visual, git-trackable (canonical)
- **ISO** = Traditional, standard, convenient (derived)

Both formats serve different users while booting the same system. Choose the format that matches your use case, but remember: **the PNG is the real OS**.