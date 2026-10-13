# Spatial ELF Loader Specification

## Overview

The Spatial ELF Loader loads RV32I ELF binaries (like xv6 kernel) directly into the Geometry OS spatial substrate for execution. It bridges the gap between ELF segments and spatial memory regions.

## Memory Layout

```
Spatial Grid (128x256 standard):
┌─────────────────────────────────────────┐
│ Rows 0-8:   SpatialRegisterBank (x0-x31)│
│             T_ADDR (32), T_Y (33)       │
│             CSR_MEPC (34), CSR_MTVEC (35)│
│             T_CSR (36), T_BYTE (37)      │
│             CSR_MSTATUS (38)             │
├─────────────────────────────────────────┤
│ Rows 10-2047: .text (transpiled code)   │
│              Uses row-banking:           │
│              - bank_height_shift = 7     │
│              - bank_width = 52           │
│              - code_base_x = 0           │
│              - code_base_y = 10          │
│              - original_code_base_x = 0  │
├─────────────────────────────────────────┤
│ Rows 2048-4095: .data/.rodata/.bss      │
│              mem_base_y = 2048           │
│              mem_base_x = 0              │
│              mem_base_vaddr = 0x80000000 │
│              (word-per-cell, linear)     │
└─────────────────────────────────────────┘
```

## RISC-V Transpiler Configuration

```rust
RiscvTranspiler::new(
    code_base_x: 0,           // Code starts at left edge
    code_base_y: 10,          // After register bank
    reg_base_x: 0,            // Register bank at left edge
    reg_base_y: 0,            // Register bank at top
)
.with_base_pc(text_vaddr)     // ELF text section address
.with_row_banking(64, 128)    // bank_width=64 (power of 2), bank_height=128 rows
```

## Banking Math (Runtime PC → Coordinate)

For instruction at RISC-V PC:
```rust
let offset = (pc - text_vaddr) / 4;  // Instruction index
let bank = offset >> 7;  // bank_height_shift = 7 (bank_height = 128)
let row = offset & 127;  // bank_height - 1
let y = code_base_y + row;
let x = bank * 64;  // bank_width = 64
```

## Data Section Seeding

Each 32-bit word from ELF data segments becomes an inert NOP cell:
```rust
let cell = CellState {
    opcode_or_type: TYPE_NOP,
    is_active: 0,
    data_buffer: word_value,
    executing: 0,
};
```

Coordinate mapping for data sections:
```rust
let mem_offset = (vaddr - mem_base_vaddr) / 4;  // Word index
let x = mem_base_x + (mem_offset % grid_width);
let y = mem_base_y + (mem_offset / grid_width);
```

## Stack Initialization

Stack pointer (x2/sp) set to high memory:
```rust
let stack_top_vaddr = mem_base_vaddr + 4 * 1024 * 1024;  // 4MB stack
```

Seed via LDI instruction in bootloader or direct cell write.

## Entry Point Activation

1. Convert ELF e_entry to coordinate using banking math
2. Set `is_active = 1` on that cell
3. Push grid to GPU
4. Execution begins automatically via substrate

## BSS Section

Zero-initialized (.bss) sections emit NOP cells with `data_buffer = 0`.

## Unknown CSRs

CSRs not implemented read zero via LDI x0, 0 pattern.

## Unsupported Features

- Misaligned halfword access (xv6 never emits)
- M-extension beyond MUL/DIV
- Floating-point extensions
- Atomic extensions (A)

## Implementation Steps

1. Add `Elf32Shdr` structure
2. Parse section headers to find .text, .data, .rodata, .bss
3. Extract .text section instructions (4-byte aligned)
4. Transpile .text via `RiscvTranspiler::transpile_program` with banking
5. Seed data sections via `emit_data_sections`
6. Initialize stack pointer in x2 register
7. Activate entry point cell
8. Return complete cell vector for grid upload