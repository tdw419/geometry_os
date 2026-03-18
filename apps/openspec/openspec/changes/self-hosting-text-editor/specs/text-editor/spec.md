# Spec: Text Editor Glyph Program

## Memory Layout

| Address | Size | Purpose |
|---------|------|---------|
| 0x0000-0x00FF | 256 | Text Editor code |
| 0x0100-0x01FF | 256 | Editor state |
| 0x0200-0x02FF | 256 | Input mailbox |
| 0x1000-0x1FFF | 4096 | Text buffer (source) |
| 0x3000-0x3FFF | 4096 | Assembler input |
| 0x5000-0x5FFF | 4096 | Compiled output |

## Editor State Structure

```
0x100: cursor (u32)
0x101: buffer_len (u32)
0x102: mode (u32)  // 0=normal, 1=insert
```

## Mailbox Structure

```
0x200: event_type (u32)
0x201: char (u32)      // for INSERT events
0x202: unused (u32)
```

## Event Types

| Code | Name | Parameters |
|------|------|------------|
| 1 | INSERT | char in 0x201 |
| 2 | DELETE | none |
| 3 | CURSOR_LEFT | none |
| 4 | CURSOR_RIGHT | none |
| 5 | COMPILE | none |
| 6 | RUN | none |

## Instruction Encoding

Uses standard Glyph encoding:
- Word 0: `opcode | (stratum << 8) | (p1 << 16) | (p2 << 24)`
- LDI: Word 1 = immediate value

## Key Opcodes

| Opcode | Name | Usage |
|--------|------|-------|
| 1 | LDI | Load immediate |
| 2 | MOV | Copy register |
| 3 | LOAD | Read from memory |
| 4 | STORE | Write to memory |
| 5 | ADD | Addition |
| 6 | SUB | Subtraction |
| 9 | JMP | Unconditional jump |
| 10 | BEQ | Branch if equal |
| 13 | HALT | Stop execution |
| 225 | SPATIAL_SPAWN | Create child VM |

## Test Cases

### test_text_buffer_insert
- Pre: mailbox has INSERT event with 'L'
- Post: buffer[0] = 76, cursor = 1, buffer_len = 1

### test_text_buffer_delete
- Pre: buffer = "HELLO", cursor = 5
- Post: buffer[4] = 0, cursor = 4, buffer_len = 4

### test_editor_compile_simple
- Pre: buffer = "LDI r0, 42\nHALT\n"
- Post: output[0] = 0x00000001, output[1] = 42, output[2] = 0x0000000D

### test_edit_compile_execute_loop
- Pre: buffer = "LDI r0, 0xDEAD\nLDI r1, 0x400\nSTORE [r1], r0\nHALT\n"
- Post: memory[0x400] = 0xDEAD
