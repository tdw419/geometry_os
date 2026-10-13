# Spatial ELF Loader Implementation

## Status: COMPLETE ✅

The Spatial ELF Loader has been implemented in `payload_loader.rs`. It loads RV32I ELF binaries (like xv6 kernel) directly into the Geometry OS spatial substrate for execution.

## Implementation Details

### Key Function

```rust
pub fn load_spatial_elf(
    &self,
    elf_data: &[u8],
    mem_base_vaddr: u32,
    mem_base_x: u32,
    mem_base_y: u32,
) -> Result<Vec<(usize, usize, CellState)>, LoadError>
```

### Memory Layout

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
│              - bank_height = 128         │
│              - bank_width = 64           │
│              - code_base_x = 0           │
│              - code_base_y = 10          │
├─────────────────────────────────────────┤
│ Rows 2048-4095: .data/.rodata/.bss      │
│              mem_base_y = 2048           │
│              mem_base_x = 0              │
│              mem_base_vaddr = 0x80000000 │
│              (word-per-cell, linear)     │
└─────────────────────────────────────────┘
```

### Transpiler Configuration

```rust
RiscvTranspiler::new(0, 10, 0, 0)  // code_base_x, code_base_y, reg_base_x, reg_base_y
    .with_base_pc(text_vaddr)       // ELF text section virtual address
    .with_row_banking(64, 128)     // bank_width=64 (power of 2), bank_height=128
```

**Note**: Bank width uses 64 (not 52) because `with_row_banking` requires power-of-2 values. 64 is the next power of 2 that fits SB (~49 cells).

### Banking Math (Runtime PC → Coordinate)

For instruction at RISC-V PC:
```rust
let offset = (pc - text_vaddr) / 4;  // Instruction index
let bank = offset >> 7;              // offset / 128 (bank_height_shift = 7)
let row = offset & 127;              // offset % 128 (bank_height - 1)
let y = code_base_y + row;           // 10 + row
let x = bank * 64;                   // bank * bank_width
```

### Section Processing

1. **.text section** (SHF_ALLOC | SHF_EXECINSTR):
   - Extracts 4-byte aligned instructions
   - Transpiles via `RiscvTranspiler::transpile_program`
   - Uses banking for large programs

2. **.data/.rodata sections** (SHF_ALLOC | SHT_PROGBITS):
   - Extracts initialized data words
   - Emits as NOP cells with `data_buffer` set to word value
   - Maps using `(vaddr - mem_base_vaddr) / 4`

3. **.bss section** (SHF_ALLOC | SHT_NOBITS):
   - Zero-initialized (no file data)
   - Emits NOP cells with `data_buffer = 0`

### Stack Initialization

```rust
let stack_top_vaddr = mem_base_vaddr + 4 * 1024 * 1024;  // 4MB stack

// Stack pointer (x2/sp) set via direct cell write at (2, 0)
cells.push((2, 0, CellState {
    opcode_or_type: TYPE_NOP,
    is_active: 0,
    data_buffer: stack_top_vaddr,
    executing: 0,
}));
```

### Entry Point Activation

1. Converts ELF `e_entry` to instruction offset: `(entry_point - text_vaddr) / 4`
2. Calculates bank and row using bitwise math
3. Computes entry coordinate: `(bank * 64, 10 + row)`
4. Sets `is_active = 1` on that cell

### ELF Structures Added

```rust
#[repr(C)]
struct Elf32Shdr {
    sh_name: u32,
    sh_type: u32,
    sh_flags: u32,
    sh_addr: u32,
    sh_offset: u32,
    sh_size: u32,
    sh_link: u32,
    sh_info: u32,
    sh_addralign: u32,
    sh_entsize: u32,
}

const SHT_NULL: u32 = 0;
const SHT_PROGBITS: u32 = 1;
const SHT_NOBITS: u32 = 8;
const SHF_ALLOC: u32 = 0x2;
const SHF_EXECINSTR: u32 = 0x4;
```

## Test Coverage

- `test_spatial_elf_loader`: Validates that a minimal ELF can be parsed and cells are emitted
- Entry point activation verified by checking `is_active == 1` cells

## Next Steps

To boot xv6 on the spatial substrate:

1. Build xv6 with RISC-V toolchain: `riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32`
2. Call `load_spatial_elf(xv6_kernel.elf, 0x80000000, 0, 2048)`
3. Upload cells to spatial grid
4. GPU execution begins automatically

## Limitations Documented

- Misaligned halfword access not supported (xv6 never emits)
- M-extension beyond MUL/DIV not implemented
- Unknown CSRs read zero
- No floating-point or atomic extensions

## Files Modified

- `payload_loader.rs`: Added `Elf32Shdr`, section constants, `load_spatial_elf` method, test
- `spatial_elf_loader_spec.md`: Created specification document