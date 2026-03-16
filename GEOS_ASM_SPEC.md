# Geos-Asm: Symbolic Glyph Assembly Language

## Overview
Geos-Asm is a structured assembly language for the Glyph VM that improves readability and maintainability while keeping close to the hardware model. It adds named constants, typed variables, control flow constructs, and functions, compiling down to raw .glyph files.

## Syntax

### Constants
```
@const NAME = value  // 32-bit integer
```
Example:
```
@const GUEST_PC = 0x14000
@const UART_OUT = 0x0200
```

### Variables
```
.var name: type  // Local variable (allocated to register or stack)
```
Types: `u32`, `ptr` (pointer to Hilbert-addressed memory)
Example:
```
.var temp: u32
.var guest_pc_save: ptr
```

### Labels
```
:labelname
```
Used for jump targets.

### Instructions
Instruction syntax: `opcode dest, src1, src2`
Where operands can be:
- Constants: `@const_name`
- Variables: `var_name`
- Literals: `0x1234` or `42` (treated as u32)
- Registers: `r0`..`r31` (for low-level access)

Common opcodes:
- `LDI dest, imm`  // Load immediate
- `LOAD dest, src` // Load from memory (src is ptr)
- `STORE dest, src` // Store to memory (dest is ptr)
- `ADD dest, src1, src2`
- `SUB dest, src1, src2`
- `AND dest, src1, src2`
- `OR dest, src1, src2`
- `XOR dest, src1, src2`
- `EQ dest, src1, src2`  // Set dest to 1 if equal, else 0
- `LT dest, src1, src2`  // Set dest to 1 if less than, else 0
- `JUMP label`
- `JZ dest, label`       // Jump if zero
- `JNZ dest, label`      // Jump if not zero
- `HALT`

### Control Flow
```
if condition:
    // then block
[else:
    // else block]
endif

while condition:
    // body
endwhere
```
Conditions are expressions that produce a boolean (u32 0 or 1).

### Functions
```
func name(param1: type1, param2: type2, ...) -> ret-type:
    // local variables
    // body
    return value  // optional
endfunc
```
Parameters are passed in registers (following RISC-V-like convention: a0-a7 for params, a0 for return).
Locals are allocated to remaining registers or stack if needed.

## Example: Boot Code
```geos-asm
@const GUEST_PC = 0x14000
@const UART_OUT = 0x0200

func boot(entry_point: u32) -> u32:
    .var temp: u32
    
    store(GUEST_PC, entry_point)
    LDI temp, 0x47  // 'G'
    store(UART_OUT, temp)
    
    return entry_point
endfunc
```

## Compilation Process
1. Parse geos-asm source
2. Resolve constants and labels
3. Allocate registers to variables (simple linear scan allocator)
4. Convert control flow to jumps and labels
5. Emit raw .glyph instructions with register numbers
6. Output .glyph file

## Benefits
- No magic numbers: `@const GUEST_PC` vs `0x14000`
- Clear intent: `store(GUEST_PC, entry_point)` vs `LDI r1, 0x14000; STORE r1, r0`
- Structured control flow: `if/else/while` vs raw jumps
- Function abstraction with parameters/returns
- Maintains close-to-hardware mental model (still thinking in terms of loads/stores/ALU ops)