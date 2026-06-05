# Quick Reference - Memory Palace Linux

## Boot Commands

### From PNG (Recommended)
```bash
python3 palace_boot.py ubuntu_palace_working.png
```

### From ISO
```bash
# Generate ISO first
python3 palace_to_iso.py ubuntu_palace_working.png memory_palace_linux.iso

# Boot directly
qemu-system-riscv64 -nographic -machine virt -m 1G -smp 2 \
  -kernel boot/Image -initrd boot/initramfs.cpio.gz \
  -dtb boot/qemu-virt.dtb -append "console=ttyS0 earlycon=sbi" \
  -bios default
```

---

## File Sizes

```
ubuntu_palace_working.png  - 27M (PNG format)
memory_palace_linux.iso    - 22M (ISO format)
```

---

## Format Comparison

| Feature | PNG | ISO |
|---------|-----|-----|
| Primary? | ✅ YES | ❌ NO |
| Canonical? | ✅ YES | ❌ NO |
| Auto-generated? | ❌ NO | ✅ YES |
| Visualizable? | ✅ YES | ❌ NO |
| Boot script? | palace_boot.py | QEMU direct |

---

## Key Scripts

| Script | Purpose |
|--------|---------|
| `palace_boot.py` | Boot from PNG |
| `palace_to_iso.py` | PNG → ISO conversion |
| `pixelpack` | PNG encode/decode |

---

## System Specs

```
Arch:        RISC-V 64-bit
Kernel:      Linux 6.14.0
Memory:      1GB
CPUs:        2 (1 working, 1 fails)
Console:     ttyS0 @ 0x10000000
Firmware:    OpenSBI v1.3
Boot:        QEMU virt machine
```

---

## Troubleshooting

### "irqchip init failed" error
**Fixed** ✅ - Typo in DTB: `interrupt-extended` → `interrupts-extended`

### No console output
**Fixed** ✅ - Serial driver enabled in kernel

### CPU1 fails to start
**Known** - QEMU virt limitation, not OS bug. Single CPU works.

---

## Files Modified Today

```
MEMORY_PALACE_LINUX_BOOT_STATUS.md  - Boot status documentation
README.md                            - Main README
DISTRIBUTION_FORMATS.md             - Format comparison doc
palace_to_iso.py                     - PNG → ISO converter
memory_palace_linux.iso              - Generated ISO (22M)
```

---

## Quick Decision Tree

```
Need to boot OS?
├─ Use PNG (recommended)
│  └─ python3 palace_boot.py file.png
└─ Need ISO for distribution?
   └─ python3 palace_to_iso.py file.png output.iso
```

---

## Next Steps

1. ✅ **Done** - Fix boot issues
2. ✅ **Done** - Generate ISO
3. ⏳ **Todo** - Add full userspace
4. ⏳ **Todo** - Build grub-riscv64.efi
5. ⏳ **Todo** - Create release artifacts

---

**Remember**: PNG is canonical. ISO is auto-generated from PNG.

```bash
# Update workflow:
# 1. Modify PNG components
# 2. Test PNG boot
# 3. Regenerate ISO
# 4. Ship both
```