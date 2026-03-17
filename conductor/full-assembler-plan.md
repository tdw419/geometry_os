# Plan: The Full Assembler Loop

## Objective
Combine the Mnemonic Matcher, Operand Parser, and Patch-and-Copy logic into a single, top-level loop that processes multiple lines of ASCII text from the RAM texture and emits a complete, executable program.

## The Goal
Type the following into the Text Buffer at address 10000:
```
LDI r3, 42
HALT
```
The GPU should compile this into:
- Addr 200: `(1, 0, 3, 0)` (LDI r3)
- Addr 201: `42`
- Addr 202: `(13, 0, 0, 0)` (HALT)

## Register Map
- `r0`: `text_ptr` (Input cursor)
- `r1`: `current_char` (Loaded from `mem[r0]`)
- `r2`: `expected_char` / `temp`
- `r3`: `emit_ptr` (Output cursor)
- `r4`: `atlas_ptr` (Source for templates)
- `r5`: `instr_acc` (Accumulated instruction pixel)
- `r6`: `scratch` / `operand_acc`
- `r7`: `constant_multiplier` (e.g., 10)
- `r10`: `constant_1` (for increments)
- `r11`: `constant_48` (for ASCII '0' subtraction)

## Architecture: The Multi-Instruction Loop
1.  **SKIP_WHITESPACE**: `LOAD r1 = mem[r0]`. If `r1 == ' '` or `r1 == '\n'`, `r0++`, `JMP SKIP_WHITESPACE`.
2.  **MATCH_MNEMONIC**:
    - Try "LDI": Check 'L', 'D', 'I'. If match, jump to `PARSE_LDI`.
    - Try "HALT": Check 'H', 'A', 'L', 'T'. If match, jump to `EMIT_HALT`.
3.  **PARSE_LDI**:
    - Parse register (e.g., " r3"): skip ' ', match 'r', parse digit, shift into `instr_acc`, `STORE` to `[r3]`.
    - Parse immediate (e.g., ", 42"): skip ',', skip ' ', parse digit sequence, `STORE` to `[r3+1]`.
4.  **NEXT_INSTRUCTION**: Advance `r3`, loop back to `SKIP_WHITESPACE`.

## Implementation Steps
1. Create `systems/infinite_map_rs/tests/full_assembler_test.rs`.
2. Implement the integrated state machine.
3. Verify the 3-pixel compiled output.
