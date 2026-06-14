# Memory Palace Linux - Distribution Formats

This document explains the dual-format distribution strategy and when to use each.

---

## Two Formats, One OS

Memory Palace Linux is distributed in two formats:

1. **PNG** (Primary/Canonical) - Memory Palace native format
2. **ISO** (Convenience) - Standard Linux distribution format

Both formats contain the exact same OS components. PNG is the source of truth; ISO is generated from PNG.

---

## Format Comparison

| Aspect | PNG Format | ISO Format |
|--------|-----------|------------|
| **Purpose** | Native Memory Palace distribution | Convenience for Linux users |
| **Size** | 27M | 22M |
| **Compression** | None (raw pixels) | ISO 9660 filesystem |
| **Visualizable** | ✅ Yes - open in image viewer | ❌ No |
| **Boot Method** | `python3 palace_boot.py file.png` | QEMU direct kernel load |
| **Hardware Boot** | ❌ Requires PNG-aware bootloader | ✅ With grub-riscv64.efi |
| **Version Control** | ✅ Git can track images | ⚠️ Git can track, but large |
| **Unique Factor** | "Boot from an image" | Standard Linux distro |
| **Maintenance** | Single source of truth | Auto-generated from PNG |

---

## When to Use PNG

Use PNG format when:
- ✅ You want the full Memory Palace experience
- ✅ You're building/deploying on Memory Palace platform
- ✅ You need to inspect the OS visually
- ✅ You're contributing to Memory Palace ecosystem
- ✅ You want spatial computing benefits
- ✅ Booting via QEMU (recommended)

**Example:**
```bash
python3 palace_boot.py ubuntu_palace_working.png
```

---

## When to Use ISO

Use ISO format when:
- ✅ You want standard Linux distribution experience
- ✅ You're packaging for RISC-V hardware (future)
- ✅ You need to mount/extract with standard tools
- ✅ You're integrating with existing Linux tooling
- ✅ You want smaller file size

**Example:**
```bash
# Generate ISO from PNG
python3 palace_to_iso.py ubuntu_palace_working.png memory_palace_linux.iso

# Mount ISO
sudo mount -o loop memory_palace_linux.iso /mnt/iso

# Boot from ISO components
qemu-system-riscv64 -nographic -machine virt -m 1G -smp 2 \
  -kernel /mnt/iso/boot/Image \
  -initrd /mnt/iso/boot/initramfs.cpio.gz \
  -dtb /mnt/iso/boot/qemu-virt.dtb \
  -append "console=ttyS0 earlycon=sbi" \
  -bios default
```

---

## Format Conversion

### PNG → ISO (One-way conversion)

```bash
python3 palace_to_iso.py input.png output.iso
```

This extracts PNG components and packages into ISO 9660 format.

**Why one-way?**
- PNG is canonical source of truth
- ISO is generated, not maintained separately
- Changes made to PNG; ISO regenerated

### ISO → PNG (Not recommended)

While technically possible to extract ISO components and re-encode as PNG, this loses spatial computing metadata and should be avoided.

---

## File Structure

### PNG Internal Structure
```
ubuntu_palace_working.png
├── Pixel Metadata (SPBF format)
│   ├── Building (ring=1, angle=0): Kernel (22M)
│   ├── Building (ring=1, angle=1): Initramfs (717B)
│   ├── Building (ring=1, angle=2): DTB (1.6K)
│   └── Building (ring=1, angle=3): Cmdline
└── Visual pixels (can be any image)
```

### ISO Internal Structure
```
memory_palace_linux.iso
├── /
│   ├── boot/
│   │   ├── Image (22M)
│   │   ├── initramfs.cpio.gz (717B)
│   │   └── qemu-virt.dtb (1.6K)
│   ├── EFI/BOOT/
│   │   └── grub.cfg (boot menu)
│   ├── palace_boot.py (PNG boot option)
│   └── boot_iso.sh (QEMU boot script)
```

---

## Boot Workflows

### PNG Boot (Recommended)
```mermaid
graph LR
    A[PNG file] --> B[pixelpack decode]
    B --> C[Extract components]
    C --> D[QEMU boot]
```

### ISO Boot (Alternative)
```mermaid
graph LR
    A[ISO file] --> B[mount/extract]
    B --> C[QEMU boot]
```

---

## Technical Details

### PNG Encoding
- **Format**: SPBF (Spatial Byte Format)
- **Tool**: pixelpack (Rust CLI)
- **Encoding**: Base64 → CRC32 → Pixel metadata
- **Overhead**: ~33% (Base64)

### ISO Encoding
- **Format**: ISO 9660 + Rock Ridge
- **Tool**: xorriso
- **Encoding**: Filesystem image
- **Overhead**: Minimal

---

## FAQ

### Q: Why two formats?
A: PNG is the innovation; ISO is for adoption. Keep PNG as primary, use ISO for distribution to users who expect standard formats.

### Q: Which format should I ship?
A: Ship both. Document PNG as the "native" format, ISO as "convenience."

### Q: Can I edit the OS in ISO format?
A: You can extract and edit components, but edits should be made to PNG source, then regenerate ISO.

### Q: Will there ever be a bootable PNG directly?
A: Future Memory Palace firmware could boot directly from PNG, eliminating extraction step. This is the end goal.

### Q: Why not just use a container image?
A: PNG fits the spatial computing paradigm - visualizable, spatial, novel. Container images are just another archive format.

---

## Migration Path

If you're currently using ISO and want to switch to PNG:

```bash
# Step 1: Get the PNG source
# (You should already have it - PNG is canonical)

# Step 2: Verify PNG boots
python3 palace_boot.py ubuntu_palace_working.png

# Step 3: Delete old ISO
rm memory_palace_linux.iso

# Step 4: Archive old ISO if needed
mv memory_palace_linux.iso archive/

# Step 5: Re-generate ISO when needed
python3 palace_to_iso.py ubuntu_palace_working.png memory_palace_linux.iso
```

---

## Future Enhancements

### PNG Format
- [ ] Add filesystem embedding
- [ ] Support incremental updates
- [ ] Add PNG signature verification
- [ ] Create PNG with visual boot splash

### ISO Format
- [ ] Build grub-riscv64.efi for hardware boot
- [ ] Add hybrid boot support (UEFI + BIOS)
- [ ] Create checksums and signatures
- [ ] Add ISO metadata (release notes, versioning)

---

## Summary

- **PNG** = Innovation, spatial computing, canonical
- **ISO** = Convenience, standard format, auto-generated
- **Rule**: Update PNG, regenerate ISO
- **Goal**: PNG-first, ISO-secondary

**Remember**: The PNG is the real Memory Palace Linux. ISO is just a convenience wrapper for users who expect standard Linux distribution formats.

```bash
# The right way to build Memory Palace Linux:
# 1. Update PNG components
# 2. Test PNG boot
# 3. Generate ISO from PNG
# 4. Ship both

python3 palace_boot.py ubuntu_palace_working.png  # Test
python3 palace_to_iso.py ubuntu_palace_working.png  # Ship
```