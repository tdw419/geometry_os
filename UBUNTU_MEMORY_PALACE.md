# Ubuntu Inside Memory Palace

## Vision

Boot Ubuntu Linux kernel inside Geometry OS Memory Palace spatial filesystem.

## Architecture

```
Ubuntu Kernel (RISC-V 6.13.0)
  ↓ QEMU virtio-blk-pci
  ↓ Geometry OS virtio_blk.rs emulator
  ↓ ~/.geometry_os/vmfs/alpine_disk.img (2MB)
  ↓ Memory Palace spatial filesystem
```

## Current Status (2026-05-31)

### Completed

1. VirtIO block device integration
   - Disk path: ~/.geometry_os/vmfs/alpine_disk.img (2MB)
   - VirtIO backend in src/riscv/virtio_blk.rs
   - Integration test passes (test_virtio_final.sh)

2. Ubuntu kernel boots successfully
   - Kernel: Linux 6.13.0 RISC-V (22MB)
   - Location: ~/.geometry_os/fs/linux/rv64/Image
   - VirtIO block device detected: `[vda] 4096 512-byte logical blocks (2.10 MB/2.00 MiB)`

### Verified

Kernel log shows:
```
virtio_blk virtio0: [vda] 4096 512-byte logical blocks (2.10 MB/2.00 MiB)
```

### Remaining Work

1. Filesystem creation
   - Need ext4 filesystem on alpine_disk.img
   - Current image: raw 2MB with no partition table or filesystem
   - Blocked by: mkfs.ext4 requires sudo (blocklist)

2. Ubuntu rootfs installation
   - Need minimal Ubuntu userland (debootstrap, etc.)
   - Install to ext4 filesystem on disk image

3. Initramfs with shell
   - Current initrd.minimal lacks /bin/sh
   - Need working shell in initramfs for rdinit=/bin/sh

## Boot Command (QEMU direct)

```bash
qemu-system-riscv64 \
  -machine virt \
  -cpu rv64 \
  -smp 2 \
  -m 512M \
  -nographic \
  -kernel ~/.geometry_os/fs/linux/rv64/Image \
  -device virtio-blk-pci,drive=hd0 \
  -drive file=~/.geometry_os/vmfs/alpine_disk.img,format=raw,if=none,id=hd0
```

## Integration Points

- VirtIO block device at MMIO 0x10001000 (guest view)
- Guest OS sees /dev/vda
- All writes persist to Memory Palace filesystem
- Cross-boot access: multiple guests can share disk image

## Benefits

1. Persistence: Ubuntu filesystem data survives hypervisor restarts
2. Spatial encoding: Disk content becomes part of Memory Palace knowledge graph
3. Cross-boot access: Multiple guest OS instances can share the same disk image
4. Architectural consistency: Block device storage uses same spatial system as rest of Geometry OS

## Next Steps

1. Prepare disk image with ext4 filesystem (user intervention required for mkfs)
2. Install Ubuntu rootfs to disk image
3. Verify Ubuntu boots to shell with VirtIO block device mounted
4. Test persistence across reboots
5. Verify data written to disk persists in Memory Palace