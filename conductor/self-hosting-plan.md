# Specification: Self-Hosting Glyph Assembler (.glyph-native)

## Objective
Implement a two-pass assembler directly in Geometry OS Glyph Assembly (.glyph). The assembler will read its own source code from a text buffer in VRAM and emit binary RGBA instructions into a target `.rts.png` region.

## Pass 1: Symbol Table Construction
- **Goal**: Scan the source text and identify labels (`:label`).
- **Storage**: Store labels as `(Hash(name), Address)` pairs in the **Symbol Buffer** (starting at `0x20000`).
- **Action**: Increment the **Location Counter (LC)** for each non-label line.

## Pass 2: Binary Emission
- **Goal**: Convert mnemonics to opcodes and resolve labels.
- **Opcode Lookup**: Hardcoded table within the assembler.
- **Label Resolution**: Query the **Symbol Buffer** using the hash of the label name.
- **Emission**: Use `STORE` to write 32-bit RGBA instructions into the target memory region.

## Memory Mapping
| Address Range | Purpose |
|---------------|---------|
| `0x30000 - 0x3FFFF` | Input Source Text Buffer (ASCII) |
| `0x20000 - 0x20FFF` | Symbol Table Buffer |
| `0x40000 - 0x4FFFF` | Output Binary Buffer (.rts.png equivalent) |

## Core Components
1. **Tokenizer**: Identifies `MNEMONIC`, `REGISTER`, `LABEL`, `IMMEDIATE`.
2. **Hash Function**: Simple XOR-based hashing for label names.
3. **Emitter**: Translates `MNEMONIC r1, r2` -> `(Opcode, Stratum, P1, P2)`.

## Success Criteria
- The assembler can correctly assemble a simple `LDI / ADD / HALT` program.
- **Final Goal**: The assembler can assemble *itself* and produce a bit-identical output to `compile_glyph.py`.
