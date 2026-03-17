# Plan: The Operand Parser

## Objective
Extend the Mnemonic Matcher to parse operands (like `r3` and `42`) dynamically from the ASCII Text Buffer, completely eliminating hardcoded emission logic.

## The Challenge
We proved we can parse `"LDI"`. The next bytes in the buffer are `' '`, `'r'`, `'3'`, `','`, `' '`, `'4'`, `'2'`. 
We need a glyph program state machine that:
1. Skips whitespace and commas.
2. Identifies `'r'` as a register indicator.
3. Reads the digit(s) after `'r'` (e.g., `'3'`), subtracts `48` (ASCII '0'), and converts it to an integer.
4. Shifts that integer into the correct bit-mask position (e.g., `value << 16` for `p1`).
5. Identifies raw digits (e.g., `'4'`, `'2'`), accumulates them (`(4 * 10) + 2`), and emits them as the immediate `DATA` pixel.

## Architecture

The parser will be an extension of the existing Level 3 state machine:

### State: Parse Register (e.g. `r3`)
1. `LOAD` char. Check if `'r'` (114).
2. If yes, `LOAD` next char.
3. Subtract 48 (`SUB` isn't supported with immediate values directly, so we load 48 and `SUB` the registers).
4. Shift result by 16 (`SHL` opcode 216 or just multiplying by 65536 via `ADD` loop/`MUL` if available).
5. Accumulate this into our "instruction patch mask" register.

### State: Parse Immediate (e.g. `42`)
1. `LOAD` char. Check if it's a digit (>= 48 and <= 57).
2. If yes, subtract 48 to get value.
3. Add to `accumulator`.
4. `LOAD` next char. If digit, `accumulator = (accumulator * 10) + new_value`.
5. Repeat until space/newline/null.
6. Emit `accumulator` as the second pixel.

## Next Steps
Design the WGSL instruction sequence for the `parse_reg` and `parse_imm` blocks to add to our test framework.
