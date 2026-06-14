# Memory Palace Boot

## How It Works

Geometry OS can store and boot RISC-V Linux binaries entirely through its Memory Palace coordinate system. No filesystem access needed — binaries live in VM coordinate metadata and are extracted on boot.

## Architecture

```
import_binary <file> <building_id> [format] [encoding]
      │
      ▼
  BinaryMetadata {
    format: "elf" | "raw" | "rts.png",
    encoding: "base64" | "hex" | "binary_pixels",
    data: <encoded bytes>,
    size_bytes: N,
    checksum: <fnv-1a>,
    injected: false
  }
      │
      ▼  serialized to JSON
  vm.coordinate_metadata[ (building_id << 16) | 0 ]
      │
      ▼  + RAM[0x7500 + building_id] = (building_id << 16) | 0
  Building table entry points to coordinate metadata
```

## Two Boot Paths

### Path 1: hypervisor_boot — QEMU (fast, full virtio)

```
hypervisor_boot arch=riscv64 kernel=building:42 initrd=building:45 ram=512M
      │
      ▼ resolve_pixel_paths_with_vm()
  Detects building:N → extract_binary_from_building() → temp file
      │
      ▼ QemuBridge::spawn()
  QEMU process (real RISC-V emulator, full speed)
      │
      ▼
  OpenSBI → Linux kernel → initramfs → shell
```

**When to use:** Fast boot, needs serial I/O, needs virtio block/net.

### Path 2: riscv_boot — Built-in Emulator (no external deps)

```
riscv_boot kernel=building:42 initrd=building:45 ram=512 bootargs=console=ttyS0
      │
      ▼ extract_binary_bytes_from_building()
  Returns raw Vec<u8> bytes — no temp files
      │
      ▼ spawn_vm_thread()
  RISC-V interpreter in-process (src/riscv/live.rs)
      │
      ▼ boot_linux_setup()
  Boots Linux inside Geometry OS process
      │
      ▼ riscv_console / riscv_input
  Serial I/O via socket commands
```

**When to use:** Pixel-native no-external-dep boot, single process, debugging.

## Socket Commands

### Store binaries in Memory Palace

```
import_binary /path/to/Image 42 elf base64
  → Stores at building 42 (coordinate key (42<<16)|0)

coord_set_binary 10 10 elf /path/to/kernel.elf
  → Stores at world coordinate (10, 10)
```

### Set building table (required for resolution)

```
poke 0x752A 0x002A0000      # RAM[0x7500+42] = (42<<16)|0
```

The building table is RAM[0x7500..0x7600]. Each entry = (x_coord << 16) | y_coord, pointing to the coordinate_metadata key where the binary was stored.

### Boot via QEMU

```
hypervisor_boot arch=riscv64 kernel=building:42 ram=512M initrd=building:45
hypervisor_boot arch=riscv64 kernel=building:42 ram=256M root=/dev/vda disk=building:44
hypervisor_console     # read QEMU serial output
hypervisor_input       # send keystrokes to QEMU
hypervisor_kill        # stop QEMU
```

### Boot via built-in emulator

```
riscv_boot kernel=building:42 ram=512 bootargs=console=ttyS0
riscv_boot kernel=building:42 initrd=building:45 ram=256 bootargs=console=ttyS0
riscv_console          # read emulated UART output
riscv_input uname -a   # send text to emulated UART
riscv_kill             # stop emulator
```

### Manage Memory Palace state

```
save <path>                   # save full VM state (incl coordinate_metadata)
restore <path>                # restore VM state
import_memory_palace <path>   # merge Memory Palace state from file
export_memory_palace <path>   # export to JSON (via vm_memory_palace_export)
```

## Data Flow Detail

### import_binary
```
File on disk → std::fs::read() → BinaryMetadata::from_file()
  → Base64 encode binary data
  → Compute FNV-1a checksum
  → Serialize BinaryMetadata to JSON
  → Insert into vm.coordinate_metadata[coord_key]
```

### riscv_boot resolution
```
config: "kernel=building:42 initrd=building:45 ram=512"
  → Parse kernel=building:42 → bid=42
  → Read RAM[0x7500+42] = coord_word
  → coord_key = (coord_word >> 16 << 16) | (coord_word & 0xFFFF)
  → Look up vm.coordinate_metadata[coord_key]["binary_data"]
  → Deserialize BinaryMetadata JSON
  → metadata.to_binary() → Vec<u8> kernel bytes
  → Same for initrd=building:45
  → GuestMode::Linux { kernel: Vec<u8>, initrd: Option<Vec<u8>> }
  → spawn_vm_thread() → boot_linux_setup()
```

## Building Table Convention

| Building ID | RAM Address | Contents | Purpose |
|---|---|---|---|
| 42 | 0x752A | (42 << 16) \| 0 | RISC-V kernel Image |
| 43 | 0x752B | (43 << 16) \| 0 | initramfs (large) |
| 44 | 0x752C | (44 << 16) \| 0 | Alpine disk image |
| 45 | 0x752D | (45 << 16) \| 0 | initramfs_fixed (small busybox) |

The building table storage uses coordinate key `(building_id << 16) | 0`, meaning the binary data is at spatial coordinate `(building_id, 0)` in the Memory Palace. The building table entry RAM[0x7500+N] stores the same coordinate word so `extract_binary_from_building()` can find it.

## Source Files

| File | What it does |
|---|---|
| `src/cli.rs` | Socket command handlers: `import_binary`, `coord_set_binary`, `import_memory_palace`, `riscv_boot`, `hypervisor_boot` |
| `src/cli.rs (resolve_*)` | `resolve_pixel_paths()`, `resolve_pixel_paths_with_vm()`, `extract_binary_from_building()`, `extract_binary_bytes_from_building()` |
| `src/main.rs` | GUI-mode socket handlers with the same commands |
| `src/encoding.rs` | `BinaryMetadata` struct, base64/hex encoding, checksums |
| `src/riscv/live.rs` | `RiscvVm`, `spawn_vm_thread()`, `GuestMode::Linux`, `boot_linux_setup()` |
| `src/qemu/bridge.rs` | `QemuBridge::spawn()`, building reference resolution in GUI mode |

## Key Distinction

**hypervisor_boot** runs QEMU as a separate Linux process. Fast, uses real hardware emulation, but requires:
- QEMU installed on the host
- Temp files for binary extraction
- A host Linux OS underneath

**riscv_boot** runs the built-in RISC-V interpreter thread. No external deps, pure pixel-native. Full state accessible from Rust. But:
- Slower (interpreted, not emulated)
- No virtio block/net
- Limited to the RISC-V features implemented in `src/riscv/`
