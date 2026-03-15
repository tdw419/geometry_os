---
name: glyph-expert
description: Expert guidance for Geometry OS Glyph Assembly (.glyph) and spatial substrate engineering. Use when asked to write programs, implement drivers, or architect spatial logic directly into the Hilbert-mapped GPU substrate.
---

# Glyph Expert: Spatial Engineering Guide

This skill provides the foundational rules for architecting software as morphology in the Geometry OS Glyph Stratum.

## 1. The Core Opcodes

### Logic Stratum (0-15)
- `NOP`: 0
- `MOV dst, src`: 206
- `LD dst, addr`: 204 (Immediate) / 3 (Load from mem)
- `ST src, addr`: 205 (Store to addr) / 4 (Store to mem)
- `ADD dst, p1`: 5
- `SUB dst, p1`: 6
- `CMP r1, r2`: 214
- `JMP addr`: 209
- `JZ addr`: 10
- `CALL addr`: 11
- `RET`: 12
- `HALT`: 13

### Bitwise Stratum (220-231)
- `AND dst, imm`: 220
- `OR dst, imm`: 221
- `XOR dst, imm`: 222
- `NOT dst`: 223
- `SHL dst, imm`: 224
- `SHR dst, imm`: 225
- `SAR dst, imm`: 226
- `AND_MEM dst, p1`: 227
- `OR_MEM dst, p1`: 228
- `XOR_MEM dst, p1`: 229
- `SHL_MEM dst, p1`: 230
- `SHR_MEM dst, p1`: 231

### Spatial & Windowing (215-237)
- `DRAW glyph_id, x, y`: 215
- `INT_DISPATCH table, mode, dst`: 218 (Mouse hit-testing)
- `SPATIAL_SPAWN entry, flags`: 225
- `CAMERA r_x, r_y`: 230
- `HILBERT_D2XY index`: 231

## 2. Standard Memory Layout (Hilbert Indices)

| Range | Purpose | Description |
|-------|---------|-------------|
| `0x0000 - 0x00FF` | **Emulator State** | PC, IR, and internal registers. |
| `0x0100 - 0x013F` | **Guest Registers** | RV64 x0-x31 (stored as 64-bit pairs). |
| `0x0200 - 0x02FF` | **I/O Bridge** | Virtual UART and Event Queue. |
| `0x1000 - 0x10FF` | **MMIO Range** | Mapped hardware device registers. |
| `0x8000 - 0xFFFF` | **Guest RAM** | The primary payload (e.g., Ubuntu RISC-V). |

## 3. Implementation Workflow

### Step 1: Architect the Morphology
Write the `.glyph` assembly. Prioritize **Spatial Coherence**. Ensure instructions that execute together live near each other in the Hilbert curve.

### Step 2: Compile to Substrate
Use the native compiler:
```bash
python3 systems/glyph_stratum/programs/compile_glyph.py input.glyph output.rts.png
```

### Step 3: Visual Verification
Analyze the `.rts.png`. Ensure labels and jumps align with the intended memory regions.

### Step 4: Boot
Dispatch via the bare-metal kernel or the `visual_kernel` CLI.

## 4. Driver Pattern: Polling
Real hardware in Geometry OS is managed by polling status registers mapped to pixels.
```assembly
:poll_loop
    LOAD r2, DEVICE_STATUS
    AND r2, READY_BIT
    JZ poll_loop
    STORE DEVICE_DATA, r1
```
