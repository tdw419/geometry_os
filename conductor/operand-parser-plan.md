# Plan: GPU-Native Operand Parser

## Objective
Implement a `.glyph` program that parses assembly operands from ASCII text in memory. This is the second major primitive for the Self-Hosting Assembler.

## Supported Formats
1. **Registers**: `r0` through `r127`.
   - ASCII 'r' followed by 1-3 digits.
2. **Decimal Immediates**: `0` through `4294967295`.
   - String of digits.
3. **Hex Immediates**: `0x0` through `0xFFFFFFFF`.
   - ASCII '0', then 'x', followed by hex digits.

## Design
- **Input**: ASCII string at `0x200`.
- **Output**: Parsed `u32` value at `0x500`.
- **State Machine**:
  - `INIT`: Read first char.
    - If 'r' -> goto `PARSE_REG`.
    - If '0' -> peek next. If 'x' -> goto `PARSE_HEX`. Else -> goto `PARSE_DEC` (starting with 0).
    - If '1'-'9' -> goto `PARSE_DEC`.
  - `PARSE_REG`: Accumulate digits, subtract ASCII '0', multiply by 10.
  - `PARSE_DEC`: Accumulate digits, multiply by 10.
  - `PARSE_HEX`: Accumulate hex digits (0-9, A-F, a-f), multiply by 16.

## Implementation Steps
1. Create `systems/glyph_stratum/programs/operand_parser.glyph`.
2. Implement the parsing logic using registers for intermediate state.
3. Add `test_operand_parser` to `systems/infinite_map_rs/src/synthetic_vram.rs`.
4. Verify with test cases: "r12", "1234", "0xABCD", "r0", "0".

## Memory Mapping
- `0x200-0x20F`: Input buffer (16 chars max).
- `0x500`: Result (parsed value).
- `0x504`: Error code (0 = success, 1 = overflow, 2 = invalid char).
