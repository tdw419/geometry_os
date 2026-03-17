# Plan: The Glyph Assembler (Self-Hosting Compiler)

## Objective
Create a Glyph program that reads ASCII text from a designated "Text Region" of the RAM texture and writes packed `u32` opcode pixels to an "Execution Region." This will prove that the GPU can compile its own visual code.

## Concept: Visual Lexing
In Geometry OS, text is just pixels. If we write ASCII characters into the RAM texture, the Glyph Assembler can read those characters (using `LOAD`), parse the mnemonic (e.g., 'L', 'D', 'I'), and output the corresponding opcode (e.g., `(1, 0, 0, 0)`).

### Memory Map for the Test
- `0-99`: The Glyph Assembler Program (The "Compiler")
- `100-199`: The Text Region (Source Code, e.g., ASCII bytes for "LDI r0 5")
- `200-299`: The Execution Region (Compiled output)

## Instructions Needed
To build an assembler, we need:
1. `LOAD` (to read the ASCII characters from the Text Region)
2. `CMP` / `BRANCH` (to check if the character is 'L', 'A', 'S', etc.)
3. `ADD` / bitwise ops (to assemble the operands into the correct color channels)
4. `STORE` (to write the compiled pixel to the Execution Region)

## Next Step
We will design a state machine that reads one instruction string at a time, parses it into an opcode/parameters, and uses the existing `STORE` command to pack it into the proper address.
