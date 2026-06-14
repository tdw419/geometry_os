# Geometry OS Boot Architecture

> **Last updated:** 2026-06-03
> **Covers:** BIOS pixel, Memory Palace boot, Pixel Linux, ChainBoot, runtime boot commands

## Overview

Geometry OS has **two distinct "boot" concepts** that often get confused:

| Concept | What it is | When it happens |
|---------|-----------|-----------------|
| **BIOS pixel** | A single-pixel configuration word for the pixel VM (bit 31 = marker) | VM initialization from PNG/save |
| **Linux boot** | Launching a RISC-V Linux kernel stored in Memory Palace | Runtime command via socket/CLI |

They are **independent systems**. The BIOS pixel configures the pixel VM canvas. Linux booting happens later as a runtime operation, reading kernel bytes from building metadata.

---

## 1. Geometry OS Process Start

```
Host terminal / GUI
    │
    ▼
geometry_os binary (src/main.rs)
    ├── --cli mode:  headless socket/REPL (no window)
    └── GUI mode:    minifb window + framebuffer
```

The native Rust binary starts, parses args, and enters either:
- **CLI mode** (`--cli`): headless socket server, `geo>` REPL prompt on stdin
- **GUI mode** (`geometry_os`): opens a window, renders the canvas, handles keyboard/mouse

---

## 2. BIOS Pixel — Configuring the Pixel VM

The **BIOS pixel** is a single 32-bit seed in the pixel grid with bit 31 set. It configures the VM's canvas before any program runs.

### Bit Layout

```
Bit:  31    30-28    27-24    23-16    15-0
     ┌─────┬────────┬────────┬────────┬──────────┐
     │ BIOS│  Mode  │  Res   │Peripher│ FPS/Chain│
     │=1   │(3 bits)│(4 bits)│(8 bits)│ (16 bits) │
     └─────┴────────┴────────┴────────┴──────────┘
```

| Field | Bits | Values |
|-------|------|--------|
| **BIOS marker** | 31 | `1` = this pixel is BIOS, `0` = regular program pixel |
| **Boot mode** | 28-30 | See table below |
| **Resolution** | 24-27 | 0=256x256, 1=512x512, 2=Text 128x32, 3=Headless |
| **Peripherals** | 16-23 | bit0=audio, bit1=network, bit2=mouse, bit3=clock |
| **FPS / ChainPtr** | 0-15 | FPS cap for program modes; chain_pointer for ChainBoot/Directory |

### Boot Modes

| Value | Mode | Purpose |
|-------|------|---------|
| 0 | **AsmSource** | Read assembly source from canvas, assemble, run |
| 1 | **RawBytecode** | Read bytecode directly from canvas pixels |
| 2 | **PixelpackCompressed** | Decompress pixelpack PNG, load bytecode |
| 3 | **NeuralSubstrate** | Neural substrate execution mode |
| 4 | **ChainBoot** | Multi-stage boot from chain manifest |
| 5 | **Directory** | Boot from directory of programs |

### Example BIOS Pixels

```python
# Bytecode mode, 512x512, audio+mouse, 60fps
bios_seed = 0x9105_003C
#   ^^ ^^ ^^ ^^^^
#   90 = BIOS(9) + mode:1(Bytecode) + res:1(512)
#   05 = peripherals: audio+mouse
#   003C = 60fps

# ChainBoot mode, 256x256, audio, chain_pointer=0
bios_seed = 0x9401_0000
#   ^^ ^^ ^^ ^^^^
#   94 = BIOS(9) + mode:4(ChainBoot) + res:0(256)
#   01 = peripherals: audio
#   0000 = chain_pointer (index of chain manifest)
```

### Source

- `src/pixel.rs` — `BootPixel` struct and `BootMode` enum
- `src/pixel.rs:fn parse(seed: u32) -> Option<BootPixel>`
- `scripts/gen_bios_png.py` — script to generate test PNGs with BIOS pixels

---

## 3. Memory Palace — The Spatial OS

The **Memory Palace** is a spatial building system that runs inside the pixel VM. It is **not booted by the BIOS** — it's loaded from a save file or built at runtime.

### How Memory Palace Starts

```
geometry_os --load <save_file>     # Load from save
  └── VM state restored (io.rs v4 format)
       ├── Buildings: Vec<Building> (from vm.buildings)
       ├── Metadata: coordinate_metadata HashMap
       └── Canvas: snapshot of pixel grid
              └── BIOS pixel was already baked into save
```

Or built interactively:
```
> spawn_building MyHouse 52 48 0xCCCCCC
  └── vm.add_building(52, 48, 0xCCCCCC, "MyHouse")
       └── buildings Vec grows (unlimited)
       └── sync_buildings_to_ram() caches first 32 in RAM[0x7500]
```

### Memory Palace Data Model

```
Memory Palace
  ├── buildings: Vec<Building>  (unlimited, heap-backed)
  │    └── Each: { id, x, y, type_color, name }
  ├── building_metadata: HashMap<u32, HashMap<String, String>>
  │    └── Arbitrary key-value metadata per building
  └── coordinate_metadata: HashMap<u64, HashMap<String, String>>
       └── Spatial annotations at (x,y) coordinates
            └── "binary_data" → BinaryMetadata JSON (for Linux kernels)
```

### Backward Compat RAM Table

The first 32 buildings are synced to RAM[0x7500..0x7600] for legacy program compatibility:

```
RAM[0x7500 + i*4]     = building.x
RAM[0x7500 + i*4 + 1] = building.y
RAM[0x7500 + i*4 + 2] = building.type_color
RAM[0x7500 + i*4 + 3] = 0x7600 + i*16  (name pointer)
RAM[0x7580]            = total building count (unbounded)
RAM[0x7600 + i*16]     = building name string (null-terminated, 16 chars)
```

### Source

- `src/vm/mod.rs` — `add_building()`, `remove_building()`, `sync_buildings_to_ram()`
- `src/vm/types.rs` — `Building` struct
- `src/vm/io.rs` — v4 save/load format
- `src/export.rs` — import/export Memory Palace to JSON

---

## 4. Running Pixel VM Programs

The pixel VM interprets assembly/bytecode loaded from the canvas. This is the "normal" way to run Geometry OS programs — not the Linux boot path.

```
Canvas source text → F8 → assembler → bytecode at RAM[0x1000] → F5 → VM.step()
```

The BIOS pixel affects this by setting:
- **Resolution**: how big the canvas is
- **Peripherals**: what hardware the VM should simulate
- **FPS**: frame rate cap

But the BIOS pixel does NOT directly boot Linux. That's a separate system.

---

## 5. Booting RISC-V Linux from Memory Palace — Two Paths

This is the **runtime Linux boot** — a command you issue after the Memory Palace is loaded. Linux kernels are stored as binary metadata in Memory Palace buildings.

### Storing Linux Binaries

```
import_binary /path/to/Image 42 elf base64
  └── Building 42 now stores a RISC-V Linux kernel
       └── coordinate_metadata[(42<<16)|0]["binary_data"]
            └── BinaryMetadata { format: "elf", encoding: "base64", data: <...>, ... }
```

### Path A: hypervisor_boot — External QEMU Process

```
hypervisor_boot arch=riscv64 kernel=building:42 initrd=building:45 ram=256M disk=building:44
  │
  ├── resolve_qemu_pixel_paths() detects "building:42"
  ├── extract_binary_from_building() → /tmp/geos_building_42.bin
  ├── QEMU process spawned with temp files
  │    ├── OpenSBI → Linux kernel → initramfs → shell
  │    └── Full RISC-V emulation (virtio, GPU, network)
  └── hypervisor_console to read output
```

**Characteristics:**
- Fast (native QEMU, full speed)
- Full virtio block/net
- Requires QEMU installed on host
- Creates temp files for binary extraction

### Path B: riscv_boot — Built-in Interpreter

```
riscv_boot kernel=building:42 initrd=building:45 ram=512 bootargs=console=ttyS0
  │
  ├── extract_binary_bytes_from_building() → Vec<u8> (no temp files)
  ├── spawn_vm_thread() → boot_linux_setup()
  │    └── Built-in RISC-V interpreter (RV32IMAC + Sv32 MMU)
  │         ├── CPU: src/riscv/cpu/
  │         ├── Devices: CLINT, PLIC, UART, VirtIO
  │         └── MMU: Sv32 page table walker
  └── riscv_console / riscv_input for serial I/O
```

**Characteristics:**
- No external dependencies (pure Rust)
- No temp files (bytes stay in process memory)
- Slower (interpreted)
- Limited device support (no GPU, no network)

### Boot Architecture Stack

```
┌──────────────────────────────────────────────────────────────┐
│                    LINUX KERNEL (Guest OS)                     │
│                  RV32IMAC, sees RAM/UART/disk                 │
└────────────────────┬─────────────────────────────────────────┘
                     │
┌────────────────────▼─────────────────────────────────────────┐
│           RISC-V HYPERVISOR (geometry_os Rust code)            │
│  ┌──────────────────────────────────────────────────────┐    │
│  │  hypervisor_boot → QEMU (external process)           │    │
│  │  riscv_boot      → Built-in interpreter (in-process) │    │
│  └──────────────────────────────────────────────────────┘    │
└────────────────────┬─────────────────────────────────────────┘
                     │
┌────────────────────▼─────────────────────────────────────────┐
│           MEMORY PALACE (Building+Coordinate Storage)          │
│  ┌──────────────────────────────────────────────────────┐    │
│  │  Building 42: { x, y, type_color, name }            │    │
│  │  coordinate_metadata[(42<<16)|0]["binary_data"]     │    │
│  │    → BinaryMetadata(elf/kernel, base64, <bytes>)    │    │
│  └──────────────────────────────────────────────────────┘    │
└────────────────────┬─────────────────────────────────────────┘
                     │
┌────────────────────▼─────────────────────────────────────────┐
│              PIXEL VM (Geometry OS bytecode)                    │
│  ┌──────────────────────────────────────────────────────┐    │
│  │  Canvas + buildings + processes + windowing          │    │
│  │  Renders Memory Palace map on screen                 │    │
│  │  Initialized from BIOS pixel in save/PNG             │    │
│  └──────────────────────────────────────────────────────┘    │
└────────────────────┬─────────────────────────────────────────┘
                     │
┌────────────────────▼─────────────────────────────────────────┐
│          GEOMETRY OS (Native Rust binary)                       │
│  ┌──────────────────────────────────────────────────────┐    │
│  │  main.rs, cli.rs, mcp_server.rs                     │    │
│  │  Window/input/rendering for GUI mode                 │    │
│  │  Socket server for CLI mode                          │    │
│  └──────────────────────────────────────────────────────┘    │
└──────────────────────────────────────────────────────────────┘
```

---

## 6. The Future: ChainBoot → Memory Palace → Linux

The **ChainBoot** BIOS mode (value 4) is designed for multi-stage boot but is not yet wired to launch Linux. Today it chains pixel programs, not RISC-V kernels.

### Current ChainBoot Flow

```
BIOS pixel (ChainBoot mode, chain_pointer=N)
  │
  └── Boot stage 0 from the canvas
       │
       └── chain_pointer points to a "chain manifest" pixel
            │
            └── Manifest describes N boot stages
                 │
                 └── Each stage loads and runs in sequence
```

### What It Would Take to Boot Linux via ChainBoot

To make `BIOS pixel → Memory Palace → Pixel Linux` work natively:

1. **Wire `chain_pointer`** to resolve to a Memory Palace building containing a Linux kernel
2. **Add a new `LinuxBoot` stage type** to the chain manifest
3. **The chain loader** extracts the building's binary metadata and calls `riscv_boot` internally
4. **Framebuffer handoff** — pixel VM canvas → Linux console

This isn't done yet — today `riscv_boot` and `hypervisor_boot` are runtime commands, not chain stages. See `ROADMAP.md` phase-204+ for planned work.

---

## 7. Auto-Boot: Memory Palace → Linux on Startup

A `--boot` flag auto-launches RISC-V Linux directly from the Memory Palace when Geometry OS starts in CLI mode.

### How It Works

1. **Store the boot config** via the `set_boot_config` socket/CLI command:
   ```
   set_boot_config kernel=building:1 initrd=building:2 ram=256 bootargs=console=ttyS0
   ```
   This stores the boot arguments string at `coordinate_metadata[0]["boot_config"]`.

2. **Start with auto-boot:**
   ```
   geometry_os --cli save.sav --boot
   ```
   On startup, after loading the save file, the CLI checks `coordinate_metadata[0]` for key `"boot_config"`. If found, it parses the boot arguments and calls the built-in RISC-V emulator (`riscv_boot` path).

### Commands

| Command | Description |
|---------|-------------|
| `set_boot_config <kernel=building:N> [initrd=building:N] [ram=256] [bootargs=...]` | Set the auto-boot configuration string stored at coordinate (0,0) |
| `show_boot_config` | Display the current boot_config value |
| `geometry_os --cli <save.sav> --boot` | Start with auto-boot enabled |

### Boot Flow

```geometry_os --cli palace.sav --boot
  ├── Load save (restores Memory Palace + coordinate_metadata)
  ├── Check coordinate (0,0) for boot_config
  │    └── Not found → boot skipped, normal REPL
  │    └── Found → parse args (kernel=building:N, initrd=building:N, etc.)
  │         └── extract_binary_bytes_from_building() for each
  │              └── spawn_vm_thread() → GuestMode::Linux
  │                   └── Linux boots in built-in RISC-V emulator
  │                        └── Console output visible in terminal
  └── Socket REPL still active for interactive commands
```

### Usage Example

```bash
# Step 1: Import kernel into Memory Palace buildings
echo "import_binary ~/.geometry_os/fs/linux/rv64/Image 1 elf base64" | nc -U /tmp/geo_cmd.sock

# Step 2: Set auto-boot configuration
echo "set_boot_config kernel=building:1 initrd=building:2 ram=256 bootargs=console=ttyS0" | nc -U /tmp/geo_cmd.sock

# Step 3: Save the palace with boot config baked in
echo "save palace.sav" | nc -U /tmp/geo_cmd.sock

# Step 4: Auto-boot on next startup
geometry_os --cli palace.sav --boot
# → Linux boots automatically from Memory Palace
```

### Source

- `src/cli.rs` — `--boot` flag parsing, auto-boot logic after load
- `src/cli.rs` — `set_boot_config`/`show_boot_config` socket commands
- `src/main.rs` — `set_boot_config`/`show_boot_config` GUI socket commands

| Goal | Use |
|------|-----|
| Run pixel assembly/bytecode programs | BIOS pixel → F8 → F5 |
| Run a spatial OS with buildings | `--load <save>` or build interactively |
| Boot RISC-V Linux quickly | `hypervisor_boot arch=riscv64 kernel=...` |
| Boot RISC-V Linux with no deps | `riscv_boot kernel=...` |
| Store kernel in buildings for later boot | `import_binary <file> <building_id> [format] [encoding]` |
| Auto-boot Linux on CLI startup | `geometry_os --cli <save.sav> --boot` with `set_boot_config` |
| Native BIOS→Palace→Linux chainboot | Not yet implemented (ChainBoot expansion needed) |

## Key Files

| File | Purpose |
|------|---------|
| `src/pixel.rs` | BootPixel struct, BootMode enum, BIOS pixel parsing |
| `src/vm/mod.rs` | Vm struct with buildings Vec, add/remove/get/sync |
| `src/vm/types.rs` | Building struct definition |
| `src/vm/io.rs` | Save/load Vm state including buildings Vec |
| `src/encoding.rs` | BinaryMetadata for storing Linux kernels in coordinates |
| `src/export.rs` | Memory Palace JSON export/import with merge strategies |
| `src/cli.rs` | CLI command handlers: import_binary, riscv_boot, hypervisor_boot |
| `src/main.rs` | GUI command handlers, resolve_qemu_pixel_paths, extract_binary_from_building |
| `src/mcp_server.rs` | MCP tools for building/binary management |
| `src/riscv/live.rs` | Built-in RISC-V interpreter, GuestMode::Linux, boot_linux_setup |
| `src/qemu/bridge.rs` | QEMU process spawn with building:ID resolution |
| `MEMORY_PALACE_BOOT.md` | Detailed Memory Palace boot procedures |
