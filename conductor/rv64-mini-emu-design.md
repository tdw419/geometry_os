# RISC-V Mini Emulator (RV64I Subset) - Glyph Design Specification

## Objective
Implement a minimal RISC-V 64-bit Integer (RV64I) subset emulator directly in Geometry OS Glyph Assembly (.glyph). The emulator will run as a guest VM on the Glyph Stratum substrate, demonstrating "Visual Bootstrapping" by executing RISC-V binaries (like UART output programs) within the spatial environment.

## Architecture
- **Host**: Geometry OS Glyph Stratum (WGPU/WGSL-based Glyph VM).
- **Guest**: RISC-V 64-bit Integer (RV64I) subset.
- **Dispatch**: Glyph-native `JZ` (Jump if Zero) for opcode decoding.
- **Memory Mapping**: Spatial memory allocation for Guest Registers and RAM.

## Memory Layout (Substrate Addresses)
| Address Range | Purpose |
|---------------|---------|
| `0x000200` | UART Output (Characters written here appear in console) |
| `0x014000` | Guest PC (r10) |
| `0x014100 - 0x01417F` | Guest Register File (x0-x31, 4-byte words) |
| `0x018000 - 0x01FFFF` | Guest RAM / RISC-V Program Binary |

## Register Allocation (Host Registers)
- `r10`: Guest PC (Program Counter)
- `r11`: Guest Register Base Pointer (`0x014100`)
- `r12`: Subroutine Return Address (Internal)
- `r13`: Current Instruction (32-bit RISC-V opcode)
- `r14`: Opcode (extracted from r13)
- `r15`: rd (destination register index)
- `r16`: rs1 (source register 1 index)
- `r17`: rs2 (source register 2 index / imm)
- `r18`: Immediate / Temp Value

## Phase 1 Instruction Set
| Mnemonic | Opcode | Functionality |
|----------|--------|---------------|
| `LUI` | `0x37` | Load Upper Immediate |
| `ADDI` | `0x13` | Add Immediate (includes NOP as `addi x0, x0, 0`) |
| `SW` | `0x23` | Store Word (used for UART output) |
| `EBREAK` | `0x73` | Halt VM |

## Fetch-Decode-Execute Loop
1. **Fetch**: Read 4 bytes from `GUEST_RAM + Guest_PC`. Increment `Guest_PC` by 4.
2. **Decode**: Extract opcode (bits 0-6).
3. **Dispatch**: 
   - `temp = opcode - 0x37; JZ temp, LUI_HANDLER`
   - `temp = opcode - 0x13; JZ temp, ADDI_HANDLER`
   - `temp = opcode - 0x23; JZ temp, SW_HANDLER`
   - `temp = opcode - 0x73; JZ temp, EBREAK_HANDLER`
4. **Execute**: Perform operation on Guest Register File or RAM.
5. **Loop**: Return to Fetch.

## Test Program (UART "GEOM")
```riscv
LUI x1, 0           # Base address for UART
ADDI x1, x1, 0x200  # x1 = 0x200 (UART)
ADDI x2, x0, 71     # x2 = 'G'
SW x2, 0(x1)        # Output 'G'
ADDI x2, x0, 69     # x2 = 'E'
SW x2, 4(x1)        # Output 'E'
ADDI x2, x0, 79     # x2 = 'O'
SW x2, 8(x1)        # Output 'O'
ADDI x2, x0, 77     # x2 = 'M'
SW x2, 12(x1)       # Output 'M'
EBREAK              # Halt
```
