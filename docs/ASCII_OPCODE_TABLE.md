# ASCII Opcode Table

## The Principle

The key you press IS the opcode byte. No lookup table. No indirection.

When you press `A`, byte 0x41 goes into memory. The VM reads 0x41 and executes ADD.
When the VM encounters 0x41 in a program, a disassembler renders it as `A`.
The character, the hex, and the operation are one thing.

```
You press A → pixel 0x00000041 → VM executes ADD → screen renders "A"
```

## Uppercase -- Primary Operations

These are the instructions you use most. Capital letters for capital importance.

| Key | Hex  | Opcode | Name     | Args            | Notes |
|-----|------|--------|----------|-----------------|-------|
| A   | 0x41 | ADD    | Add      | dst, src        |       |
| B   | 0x42 | BRANCH | Branch   | cond, addr      | Conditional |
| C   | 0x43 | CALL   | Call     | addr            | Push return addr |
| D   | 0x44 | DIV    | Divide   | dst, src        |       |
| E   | 0x45 | EXEC   | Execute  | addr, arg       | Jump and run |
| F   | 0x46 | RECTF  | RectFill | x, y, w, h     | Filled rectangle |
| G   | 0x47 | CIRCLEF| Circle   | cx, cy, r       | Filled circle |
| H   | 0x48 | HALT   | Halt     |                 | Stop execution |
| I   | 0x49 | LDI    | Load Imm | dst, value      | **Needs data pixel after** |
| J   | 0x4A | JMP    | Jump     | addr            | Unconditional |
| K   | 0x4B | SHL    | Shift L  | dst, amount     |       |
| L   | 0x4C | LOAD   | Load     | dst, addr       | Read from memory |
| M   | 0x4D | MOV    | Move     | dst, src        | Register to register |
| N   | 0x4E | NOP    | No-op    |                 | Does nothing |
| O   | 0x4F | OR     | Or       | dst, src        | Bitwise |
| P   | 0x50 | PSET   | PixelSet | x, y, color     | Draw one pixel |
| Q   | 0x51 | SPAWN  | Spawn    | addr, arg       | Fork child VM |
| R   | 0x52 | RET    | Return   |                 | Pop and jump |
| S   | 0x53 | STORE  | Store    | addr, src       | Write to memory |
| T   | 0x54 | TEXT   | Text     | x, y, str_addr  | Draw string |
| U   | 0x55 | SUB    | Subtract | dst, src        |       |
| V   | 0x56 | LINE   | Line     | x1, y1, x2, y2  | Draw line |
| W   | 0x57 | BLIT   | Blit     | dst, src, count | Memory copy |
| X   | 0x58 | XOR    | Xor      | dst, src        | Bitwise |
| Y   | 0x59 | YIELD  | Yield    |                 | End frame |
| Z   | 0x5A | SPAWN+ | Spatial  | x, y, addr      | Fork at position |

## Lowercase -- Secondary Operations

Less common. Shift+letter to access. Still valid opcodes the VM recognizes.

| Key | Hex  | Opcode | Name     | Args            | Notes |
|-----|------|--------|----------|-----------------|-------|
| a   | 0x61 | AND    | And      | dst, src        | Bitwise |
| b   | 0x62 | MOD    | Modulo   | dst, src        |        |
| d   | 0x64 | LDB    | LoadByte | dst, addr       | Single byte |
| f   | 0x66 | ISSUE  | Issue    | title, body     | Create work item (planned) |
| g   | 0x67 | PGET   | PixelGet | x, y            | Read screen pixel |
| i   | 0x69 | INT    | Interrupt| vector          | System call |
| k   | 0x6B | SHR    | Shift R  | dst, amount     |        |
| m   | 0x6D | MUL    | Multiply | dst, src        |        |
| n   | 0x6E | NOT    | Not      | dst             | Bitwise invert |
| p   | 0x70 | PUSH   | Push     | value           | Stack |
| r   | 0x72 | POP    | Pop      | dst             | Stack |
| s   | 0x73 | STB    | StoreByte| addr, src       | Single byte |

## Unassigned

All 26 uppercase letters (A-Z) are assigned. Free lowercase slots for future expansion:

```
c(0x63), e(0x65), h(0x68), j(0x6A), l(0x6C), o(0x6F), q(0x71), t(0x74), u(0x75), v(0x76), w(0x77), x(0x78), y(0x79), z(0x7A)
```

## How LDI Works With This Scheme

LDI (I, 0x49) is special -- it needs an immediate value. The pixel after the I instruction is a **data pixel**, not an opcode. The VM reads it as a raw number.

Example program: "load 42 into r0, halt"

```
Address 0: 0x00000049  →  I (LDI opcode, p1=0 means r0)
Address 1: 0x0000002A  →  data pixel (42 decimal = 0x2A)
Address 2: 0x00000048  →  H (HALT)
```

You'd type: `I` (stamps LDI), then click the next cell and press +/- until it reads 0x2A, then `H` for halt.

## Reading Memory Dumps

Under this encoding, a hex dump of program memory becomes semi-readable:

```
0x0000: 49 00 2A 00  41 00 01 00  48 00 00 00
         I  .  *  .   A  .  .  .   H  .  .  .
```

You can see I, A, H without a disassembler. The letters jump out.

## Migration From Old Opcodes

The current VM uses numeric opcodes (0=NOP, 1=LDI, 5=ADD, etc.). Two options:

**Option A: Dual opcode table.** The VM recognizes both old (0x05) and new (0x41) encodings for ADD. Backward compatible, but confusing.

**Option B: Cutover.** Redefine the opcode table entirely. Old programs need reassembling. Clean break.

Recommendation: Option A for transition, then deprecate old opcodes once all .gasm files are updated.

## Assembler Mnemonic Aliases

The gasm assembler accepts shorthand aliases for common instructions:

| Alias | Expands To | Key |
|-------|-----------|-----|
| ST    | STORE     | S   |

(Add more aliases here as the assembler gains them.)

## Notes

- **BLIT** (W, 0x57) is a raw memory copy -- `memcpy(dst, src, count)`. Not a visual blit despite the name. For pixel-region copies, compose with PGET/PSET or use RECTF for fills.
- **ISSUE** (f, 0x66) is a planned opcode for creating work items (e.g. forge issues) from within the VM. Not yet implemented.
