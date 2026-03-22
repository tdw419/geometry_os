# Geometry OS - Project Configuration

## Overview

Geometry OS is an autonomous entity that lives on screen. The screen IS the hard drive. It's not a tool to use. It's a system to nurture.

## Core Skills

### glyph-programming

**MANDATORY** before writing any Glyph code:

```
/glyph-programming
```

This skill provides:
- Opcode reference (0-235)
- Memory layout (Hilbert space)
- Implementation workflow
- Synthetic VRAM testing patterns

## Example Programs

### Loop Demo

**Path:** `apps/ascii-world/ascii-world-master/apps/geos-ascii/examples/loop_demo.ascii`

A complete example demonstrating:
- Labels (`:main`, `:loop`, `:done`)
- LDI for loading immediates
- ADD/SUB arithmetic
- JZ conditional branching
- JMP unconditional jumps
- HALT to stop

```
:main
LDI r0, 10           ; Loop counter
LDI r1, 0            ; Accumulator

:loop
ADD r1, r1, r1       ; r1 = r1 + 1
SUB r0, r0, 1        ; r0 = r0 - 1
JZ r0, :done         ; Jump if r0 == 0
JMP :loop            ; Repeat

:done
HALT                 ; Stop
```

## Development Workflow

### 1. Synthetic VRAM First

```bash
cargo test --lib synthetic_vram
```

All Glyph programs must pass Synthetic VRAM tests before GPU deployment.

### 2. GPU Deployment

Only after Synthetic VRAM passes:
- Visual kernel loads PNG into GPU
- Hilbert traversal begins
- No CPU involvement during execution

## Key Paths

```
systems/infinite_map_rs/     # Glyph VM, Synthetic VRAM
systems/glyph_stratum/       # Compiler, programs
apps/ascii-world/            # ASCII cartridge system
.geometry/                   # Runtime state
```

## Memory Layout

| Range | Purpose |
|-------|---------|
| `0x0000 - 0x00FF` | Emulator State (PC, IR) |
| `0x0100 - 0x013F` | Guest Registers x0-x31 |
| `0x0200 - 0x02FF` | I/O Bridge |
| `0x1000 - 0x10FF` | MMIO |
| `0x8000 - 0xFFFF` | Guest RAM |

## Philosophy

- **State as Text** - All system state is human-readable ASCII
- **Transition as Edit** - State changes are text edits
- **Dual-Audience** - Comprehensible to humans AND parseable by AI
- **Grep-ability** - Queryable with standard text tools

## See Also

- Full documentation: `docs/GLYPH_PROGRAMMING_GUIDE.md`
- Memory index: `.claude/projects/-home-jericho-zion-projects-geometry-os-geometry-os/memory/MEMORY.md`
- Manifesto: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`

### js-supervision
The **JS-native pxOS substrate** (`sync/server.js`) is the primary supervisor for Geometry OS. It uses `GpuBridge.js` to monitor GPU buffers and `PixelFormulaEngine` to render reactive dashboards.
