# Linux on Pixels: Quick Start Guide

## 5-Minute Setup

### 1. Build RISC-V Linux (RV32)

```bash
# Clone Linux
git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
cd linux
git checkout v6.1

# Configure for RV32 minimal
make ARCH=riscv CROSS_COMPILE=riscv32-linux-gnu- defconfig rv32_defconfig

# Key configs (edit .config or use menuconfig)
CONFIG_32BIT=y
CONFIG_RISCV_ISA_RV32IMAC=y
CONFIG_SMP=n
CONFIG_MMU=y
CONFIG_VMAP_STACK=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_BLK=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_PRINTK=y
CONFIG_EARLY_PRINTK=y

# Build vmlinux
make ARCH=riscv CROSS_COMPILE=riscv32-linux-gnu- vmlinux -j8

# Output: vmlinux (ELF32 binary)
```

### 2. Create Initramfs

```bash
# Create initramfs directory
mkdir -p initramfs/{bin,sbin,etc,proc,sys,dev}

# Copy busybox (RV32)
wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
tar xf busybox-1.36.1.tar.bz2
cd busybox-1.36.1
make ARCH=riscv CROSS_COMPILE=riscv32-linux-gnu- defconfig
make ARCH=riscv CROSS_COMPILE=riscv32-linux-gnu- busybox
cp busybox ../initramfs/bin/
cd ..

# Create init script
cat > initramfs/init << 'EOF'
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
echo "========================================"
echo "  Linux booted on PIXELS!"
echo "========================================"
echo "VFS Surface: 0x70000000"
echo "Try: cat /proc/cpuinfo"
echo "Try: hexdump /dev/mem | head"
echo "========================================"
while true; do
    sleep 1
done
EOF
chmod +x initramfs/init

# Package initramfs
cd initramfs
find . | cpio -o -H newc | gzip > ../initramfs.cpio.gz
cd ..
```

### 3. Place Files in Geometry OS

```bash
# Copy to geometry_os filesystem
mkdir -p .geometry_os/fs/linux/rv32
cp vmlinux .geometry_os/fs/linux/rv32/
cp initramfs.cpio.gz .geometry_os/fs/linux/rv32/
```

### 4. Boot Linux

```bash
# From geometry_os root
cargo build --release

# Run with Linux boot visualization
./target/release/geometry_os --cli << 'EOF'
# Load Linux boot visualizer
load programs/linux_boot_viz.asm
run
EOF
```

Or via the RISC-V hypervisor binary:

```bash
cargo run --bin riscv_boot_viz --release \
  -- kernel=.geometry_os/fs/linux/rv32/vmlinux \
     initrd=.geometry_os/fs/linux/rv32/initramfs.cpio.gz \
     bootargs="console=ttyS0 earlycon=uart8250,mmio,0x10000000,115200n8" \
     max_instructions=10000000
```

---

## What You'll See

### Console Output

```
[boot] boot_linux_setup_with_patches: ram=512MB, args='console=ttyS0...'
[boot] loading kernel image (len=5242880)...
[boot] kernel loaded at 0x80200000, highest=0x80500000
[boot] DTB ram_size: 524288K (524288K total, pool: 4096K)
[boot] Patch summary: dtb=1 setup_vm=1 timebase=1 lpj=1 ...
[boot] entry_pa=0x80200000

[linux] Linux version 6.1.0 ...
[linux] bootconsole [early0] enabled
[linux] setup_vm: done ← PATCHED
[linux] satp: 0x80000001 ← MMU enabled
[linux] Zone ranges:
[linux]   Normal   [mem 0x80000000-0x8fffffff]
[linux] Kernel command line: console=ttyS0 ...
[linux] CPU: 0x80000000 [hart 0] RV32IMAC
[linux] printk: console [ttyS0] enabled
[linux] random: crng init done
[linux] ========================================
[linux]   Linux booted on PIXELS!
[linux] ========================================
[linux] VFS Surface: 0x70000000
[linux] Try: cat /proc/cpuinfo
[linux] Try: hexdump /dev/mem | head
[linux] ========================================
```

### Visual Output (256x256)

```
BOOT VIZ    INST:00012345    FLT:0000
PC: 0x80200120  SP: 0x80800000  PRIV:S [M]
RA: 0xC0002C18  GP: 0xC0000000  TP: 0xC0010000
SATP: 0x80000001  ┃ MSTAT:0x00002000
MCAUSE: 0x00000000  MEPC: 0x80200000
SCAUSE: 0x00000000  SEPC: 0xC0002C18
STVEC: 0xC0000000  MTVEC: 0x80000000
[Register grid...]
[Instruction heatmap...]
```

---

## Testing Guest File Creation

### 1. Create Guest Program

```c
// .geometry_os/guest/create_file.c
#include <stdint.h>

#define VFS_BASE 0x70000000
#define VFS_PIXEL(row, col) (*(volatile uint32_t*)(VFS_BASE + ((row)*256 + (col))*4))
#define VFS_CONTROL (*(volatile uint32_t*)(VFS_BASE + 256*256*4))

uint32_t fnv1a(const char *s) {
    uint32_t h = 0x811c9dc5;
    while (*s) { h ^= (uint8_t)*s++; h *= 0x01000193; }
    return h;
}

int main() {
    // Write "Hello from Linux!" to pixels
    const char *msg = "Hello from Linux!";
    uint32_t hash = fnv1a("test.txt");
    uint16_t len = 18;

    // Create file at row 1
    VFS_PIXEL(1, 0) = (len << 16) | ((hash >> 8) & 0xFF) | 0x03;

    // Write filename
    for (int i = 0; i < 8; i++) {
        VFS_PIXEL(1, 1 + i) = "test.txt"[i];
    }

    // Write data as pixels
    for (int i = 0; i < len; i++) {
        uint32_t px = msg[i];
        VFS_PIXEL(1, 64 + i) = px;
    }

    // Update directory
    VFS_PIXEL(0, 2) = (1 << 16) | (hash & 0xFFFF);
    VFS_PIXEL(0, 1) = 1;

    // Flush to host
    VFS_CONTROL = 0x01;

    return 0;
}
```

### 2. Compile to ELF

```bash
riscv32-linux-gnu-gcc -nostdlib -static -o .geometry_os/fs/create_file.elf \
    .geometry_os/guest/create_file.c
```

### 3. Boot and Run

```bash
cargo run --bin riscv_boot_viz --release \
  -- kernel=.geometry_os/fs/create_file.elf \
     max_instructions=1000000
```

### 4. Verify File on Host

```bash
# Check if file appeared
ls -l .geometry_os/fs/test.txt
cat .geometry_os/fs/test.txt
# Output: Hello from Linux!
```

---

## Debugging Boot Failures

### 1. Check ELF Loading

```bash
# Verify vmlinux is ELF32
file .geometry_os/fs/linux/rv32/vmlinux
# Should show: ELF 32-bit LSB executable, RISC-V

# Check load addresses
readelf -l .geometry_os/fs/linux/rv32/vmlinux | grep LOAD
# Should show PT_LOAD segments at 0x80000000+
```

### 2. Enable Trace Output

```rust
// In src/riscv/boot.rs
eprintln!("[boot-debug] RAM: base=0x{:08X} size=0x{:X}",
    vm.bus.mem.ram_base,
    vm.bus.mem.size()
);

// Check byte at segment 1 start
let b0 = vm.bus.read_byte(0x80400000).unwrap_or(0xFF);
eprintln!("[boot-valid] PA 0x80400000: 0x{:02X}", b0);
```

### 3. Inspect VFS Surface

```bash
# Dump directory index
hexdump -C .geometry_os/fs/vfs_surface.raw | head -20

# Should show:
# 00000000  53 46 58 50 01 00 00 00  ...
#           ^ magic   ^ file_count
```

### 4. Run Test Suite

```bash
# Test guest VFS
cargo test --lib test_guest_vfs_write --release -- --nocapture

# Test Linux early boot
cargo test --lib test_linux_kernel_early_boot --release -- --nocapture
```

---

## Performance Tips

### 1. Use Release Build

```bash
# Debug builds are 10x slower
cargo build --release
```

### 2. Limit Instruction Count

```bash
# Don't run forever - set a reasonable limit
max_instructions=10000000  # 10M instructions ~1-2 seconds
```

### 3. Disable Unnecessary Devices

```rust
// In DtbConfig
let mut dtb_config = dtb::DtbConfig::default();
dtb_config.skip_plic = true;  // Skip PLIC (reduces interrupt overhead)
```

### 4. Use smaller kernel

```bash
# Minimal Linux config = ~5MB vmlinux
# Full config = ~15MB vmlinux
# Smaller = faster load
```

---

## Common Issues

### Issue: "Segment overflow when loading ELF"

**Cause:** Kernel PT_LOAD segments exceed allocated RAM

**Fix:** Increase RAM size

```rust
// In boot_linux_setup_with_patches()
let ram_size_mb = 768;  // Increase from 512
```

### Issue: "Paging fault at 0xC0000000"

**Cause:** MMU translation failure (kernel page tables not set up)

**Fix:** Verify setup_vm patch is applied

```rust
let summary = patches.apply(&mut vm.bus, ...);
eprintln!("setup_vm patch: {}", summary.setup_vm);
```

### Issue: "No console output"

**Cause:** UART driver not initialized or wrong console bootarg

**Fix:** Verify bootargs and UART address

```rust
dtb_config.bootargs = "console=ttyS0 earlycon=uart8250,mmio,0x10000000,115200n8".to_string();
```

### Issue: "Guest file not appearing on host"

**Cause:** Flush not triggered or VFS surface not synced

**Fix:** Call VFS_CONTROL = 0x01 to trigger flush

```c
VFS_CONTROL = 0x01;  // Bit 0 = FLUSH
```

---

## Advanced: Custom Kernel Patches

### 1. Generate System.map

```bash
# During Linux build
make ARCH=riscv CROSS_COMPILE=riscv32-linux-gnu- vmlinux System.map
cp System.map .geometry_os/fs/linux/rv32/
```

### 2. Load Patches

```rust
use crate::riscv::kernel_patches::KernelPatches;

let patches = KernelPatches::load_from_system_map(
    ".geometry_os/fs/linux/rv32/System.map"
)?;

let (mut vm, ...) = RiscvVm::boot_linux_setup_with_patches(
    kernel_image,
    Some(initramfs),
    512,
    bootargs,
    Some(patches)
)?;
```

### 3. Add Custom Patch

```rust
// In src/riscv/kernel_patches.rs
pub struct KernelPatches {
    pub setup_vm: Option<u32>,
    pub custom_func: Option<u32>,  // ← Add your patch
    // ...
}

pub fn apply(&self, bus: &mut Bus, ...) -> PatchSummary {
    let mut summary = PatchSummary::default();

    // Apply custom patch
    if let Some(addr) = self.custom_func {
        // Patch function at addr
        bus.write_word(addr, patched_instruction)?;
        summary.custom_func = 1;
    }

    summary
}
```

---

## Next Steps

1. **Explore the architecture:** Read `LINUX_ON_PIXELS_ARCHITECTURE.md`
2. **Run the tests:** `cargo test --lib`
3. **Visualize boot:** Try `programs/linux_boot_viz.asm`
4. **Create files:** Write a guest program that uses the VFS surface
5. **Boot to shell:** Build a larger initramfs with busybox
6. **Add devices:** Extend VirtIO support (net, blk, console)
7. **RV64 migration:** Expand to 64-bit (future)

---

*Quick Start Guide for Linux on Pixels*
*Part of Geometry OS Documentation*