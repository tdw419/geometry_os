# WASM Subset Design for Geometry OS

## Target: MVP (Minimum Viable Product) WASM

### Required Features

1. **Value Types**: i32 only (match Glyph VM word size)

2. **Instructions**:
   - Control: block, loop, br, br_if, return, call, end
   - Variables: local.get, local.set
   - Memory: i32.load, i32.store
   - Numeric: i32.add, i32.sub, i32.mul, i32.div_s, i32.and, i32.or, i32.xor, i32.shl, i32.shr_s
   - Comparison: i32.eq, i32.ne, i32.lt_s, i32.gt_s, i32.le_s, i32.ge_s

3. **Memory**: Linear memory, 1 page (64KB), mapped to Hilbert space

### Not Required (Phase 3)

- Floating point (f32/f64)
- Tables / indirect calls
- Imports/exports (host functions only)
- Multiple memories

### Memory Map

| WASM Address | Glyph Address | Purpose |
|--------------|---------------|---------|
| 0x0000-0xFFFF | 0x20000-0x2FFFF | WASM linear memory |
| - | 0x30000 | WASM stack pointer |
| - | 0x30004 | WASM instruction pointer |
| - | 0x30008 | WASM base pointer |
| - | 0x3000C | WASM status register |

### Opcode Reference

| Opcode | Instruction | Description |
|--------|-------------|-------------|
| 0x00 | unreachable | Trap |
| 0x01 | nop | No operation |
| 0x02 | block | Block structure |
| 0x03 | loop | Loop structure |
| 0x04 | if | Conditional |
| 0x05 | else | Else branch |
| 0x0B | end | End block |
| 0x0C | br | Branch |
| 0x0D | br_if | Conditional branch |
| 0x0F | return | Return from function |
| 0x10 | call | Function call |
| 0x20 | local.get | Get local variable |
| 0x21 | local.set | Set local variable |
| 0x28 | i32.load | Load from memory |
| 0x36 | i32.store | Store to memory |
| 0x41 | i32.const | Constant |
| 0x45 | i32.eqz | Equal zero |
| 0x46 | i32.eq | Equal |
| 0x47 | i32.ne | Not equal |
| 0x48 | i32.lt_s | Less than signed |
| 0x49 | i32.lt_u | Less than unsigned |
| 0x4A | i32.gt_s | Greater than signed |
| 0x4B | i32.gt_u | Greater than unsigned |
| 0x4C | i32.le_s | Less or equal signed |
| 0x4D | i32.le_u | Less or equal unsigned |
| 0x4E | i32.ge_s | Greater or equal signed |
| 0x4F | i32.ge_u | Greater or equal unsigned |
| 0x67 | i32.clz | Count leading zeros |
| 0x68 | i32.ctz | Count trailing zeros |
| 0x69 | i32.popcnt | Population count |
| 0x6A | i32.add | Add |
| 0x6B | i32.sub | Subtract |
| 0x6C | i32.mul | Multiply |
| 0x6D | i32.div_s | Divide signed |
| 0x6E | i32.div_u | Divide unsigned |
| 0x6F | i32.rem_s | Remainder signed |
| 0x70 | i32.rem_u | Remainder unsigned |
| 0x71 | i32.and | Bitwise AND |
| 0x72 | i32.or | Bitwise OR |
| 0x73 | i32.xor | Bitwise XOR |
| 0x74 | i32.shl | Shift left |
| 0x75 | i32.shr_s | Shift right signed |
| 0x76 | i32.shr_u | Shift right unsigned |
| 0x77 | i32.rotl | Rotate left |
| 0x78 | i32.rotr | Rotate right |

### Estimated Implementation

~500-800 Glyph instructions (similar complexity to RISC-V emulator)

### LEB128 Encoding

WASM uses LEB128 for integers. Need to implement:
- Read unsigned LEB128 (for immediates)
- Read signed LEB128 (for offsets)
