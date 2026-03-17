# Plan: GPU-Native Self-Hosting Assembler

## Objective
Close the bootstrap loop by implementing a version of the `Full Assembler` that is capable of compiling its own source code. This is the ultimate proof of sovereignty for Geometry OS.

## Requirements
1. **Full Mnemonic Set**: Support for all common opcodes (`LDI`, `ADD`, `SUB`, `STORE`, `LOAD`, `BRANCH`, `HALT`, `SPATIAL_SPAWN`, `GLYPH_WRITE`).
2. **Label Support**:
   - **First Pass**: Identify label definitions (e.g., `:loop`) and store their addresses in a Label Table at `0xA00`.
   - **Second Pass**: Resolve label references in `JMP` and `BRANCH` instructions using the table.
3. **Operand Robustness**: Support for register names (`r0`-`r127`), decimal, and hex immediates.
4. **Memory Scalability**: Handle source files larger than 1KB.

## Memory Mapping
- `0x0000 - 0x0FFF`: **Assembler Binary** (Executing).
- `0x1000 - 0x1FFF`: **Source Table** (ASCII of the assembler itself).
- `0x2000 - 0x2FFF`: **Output Binary** (Compiled version of itself).
- `0x3000 - 0x3FFF`: **Label Table** (Labels found during Pass 1).
- `0x4000`: `PASS_COUNTER` (0 = Pass 1, 1 = Pass 2).

## Implementation Steps

### 1. Label Support (The Multi-Pass Engine)
- Update `full_assembler.glyph` logic to track its current output address without emitting during Pass 1.
- Implement a label detector (`char == ':'`).
- Store labels and their addresses in the table.

### 2. Full Opcode Integration
- Merge all matching logic from the `Mnemonic Matcher` milestone.
- Ensure all 2-pixel instructions (like `LDI`) correctly advance the address counter by 2.

### 3. Self-Hosting Verification (Synthetic VRAM)
- Load the `full_assembler.glyph` source code into `0x1000`.
- Run the `full_assembler` VM.
- **Verification**: The binary emitted at `0x2000` must be bit-identical to the original executing binary at `0x0000`.

## Success Criteria
- ✅ Assembler compiles a multi-line program with labels.
- ✅ Assembler compiles itself without errors.
- ✅ Emitted binary passes bit-identical verification against source binary.
