# Plan: GPU-Native Full Assembler

## Objective
Implement a multi-line, GPU-native assembler in `.glyph` assembly. This assembler will orchestrate the **Mnemonic Matcher** and **Operand Parser** to compile full programs directly in the Hilbert-mapped texture.

## Architecture
The assembler operates as a state machine processing a stream of ASCII characters from memory.

### 1. Memory Map
- `0x200-0x3FF`: **Source Buffer** (Input ASCII text).
- `0x500-0x6FF`: **Binary Buffer** (Output Glyph pixels).
- `0x800-0x8FF`: **Mnemonic Table** (Entries: `[char0, char1, char2, opcode]`).
- `0x900`: `SRC_PTR` (Current position in source).
- `0x904`: `BIN_PTR` (Current position in binary).

### 2. State Machine
- `SKIP_WHITESPACE`: Advance `SRC_PTR` while char is space, tab, or comma.
- `PARSE_MNEMONIC`: Read 3 chars, match against table at `0x800`, store opcode.
- `PARSE_OPERANDS`:
  - Based on the opcode, determine how many operands to parse.
  - Call the `OPERAND_PARSER` logic for each.
- `EMIT`:
  - Construct the Glyph u32: `[opcode, stratum, p1, p2]`.
  - Write to `BIN_PTR`.
  - If opcode requires immediate (e.g., `LDI`), write the immediate value to `BIN_PTR + 1`.
  - Advance `BIN_PTR`.
- `NEXT_LINE`: Advance `SRC_PTR` until newline (`\n`) or null. Loop back to `SKIP_WHITESPACE`.

### 3. Supported Instruction Subset
- `LDI reg, imm` (2 pixels)
- `ADD reg, reg` (1 pixel)
- `SUB reg, reg` (1 pixel)
- `STORE [reg], reg` (1 pixel)
- `HALT` (1 pixel)

## Implementation Steps
1. Define the mnemonic table in memory.
2. Implement the outer loop that handles line-by-line processing.
3. Integrate the whitespace skipping and newline handling.
4. Merge the optimized matching and parsing logic from previous milestones.
5. Create `systems/glyph_stratum/programs/full_assembler.glyph`.
6. Add `test_full_assembler` to `systems/infinite_map_rs/src/synthetic_vram.rs` to verify multi-line compilation.

## Verification
- **Input**:
  ```assembly
  LDI r1, 10
  LDI r2, 20
  ADD r1, r2
  HALT
  ```
- **Expected Output**:
  - `mem[500] = glyph(1, 0, 1, 0)` (LDI r1)
  - `mem[501] = 10`
  - `mem[502] = glyph(1, 0, 2, 0)` (LDI r2)
  - `mem[503] = 20`
  - `mem[504] = glyph(5, 0, 1, 2)` (ADD r1, r2)
  - `mem[505] = glyph(13, 0, 0, 0)` (HALT)
