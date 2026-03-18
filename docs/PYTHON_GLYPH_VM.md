# Python Glyph VM - Pixel Programming Without Rust

## Overview

The Python Glyph VM is a pure Python implementation of the Geometry OS virtual machine. It lets you write and run Glyph programs **without any Rust compilation**.

**Why this exists:**
- Rust compilation can crash systems (rustc at 100% CPU)
- You want to program with pixels, not programming languages
- The sovereignty principle: pixels should move pixels

**What it does:**
- Compiles Glyph assembly to VM bytecode
- Executes programs in a Python-based virtual machine
- Shows registers, memory, and execution state
- Zero dependencies beyond Python 3

## Quick Start

```bash
# Run inline assembly
python3 systems/glyph_stratum/glyph_vm.py --asm "LDI r0, 42; HALT"

# Run a .glyph file
python3 systems/glyph_stratum/glyph_vm.py my_program.glyph

# Run with verbose output
python3 systems/glyph_stratum/glyph_vm.py --verbose my_program.glyph
```

## The Glyph Instruction Set

### Data Movement

| Instruction | Format | Description |
|-------------|--------|-------------|
| `LDI` | `LDI reg, value` | Load immediate value into register |
| `MOV` | `MOV dst, src` | Copy register to register |
| `LOAD` | `LOAD dst, [addr]` | Load from memory into register |
| `STORE` | `STORE [addr], src` | Store register to memory |

### Arithmetic

| Instruction | Format | Description |
|-------------|--------|-------------|
| `ADD` | `ADD dst, src1, src2` | dst = src1 + src2 |
| `SUB` | `SUB dst, src1, src2` | dst = src1 - src2 |
| `MUL` | `MUL dst, src1, src2` | dst = src1 * src2 |
| `DIV` | `DIV dst, src1, src2` | dst = src1 / src2 |
| `MOD` | `MOD dst, src1, src2` | dst = src1 % src2 |

### Control Flow

| Instruction | Format | Description |
|-------------|--------|-------------|
| `JMP` | `JMP label` | Unconditional jump |
| `BEQ` | `BEQ r1, r2, label` | Branch if equal |
| `BNE` | `BNE r1, r2, label` | Branch if not equal |
| `BLT` | `BLT r1, r2, label` | Branch if less than |
| `BGT` | `BGT r1, r2, label` | Branch if greater than |
| `CALL` | `CALL addr` | Call subroutine |
| `RET` | `RET` | Return from subroutine |
| `HALT` | `HALT` | Stop execution |

### Bitwise Operations

| Instruction | Format | Description |
|-------------|--------|-------------|
| `AND` | `AND dst, src1, src2` | Bitwise AND |
| `OR` | `OR dst, src1, src2` | Bitwise OR |
| `XOR` | `XOR dst, src1, src2` | Bitwise XOR |
| `NOT` | `NOT dst, src` | Bitwise NOT |
| `SHL` | `SHL dst, src, amount` | Shift left |
| `SHR` | `SHR dst, src, amount` | Shift right |

### System

| Instruction | Format | Description |
|-------------|--------|-------------|
| `DRAW` | `DRAW glyph_id, x, y` | Blit glyph to screen |
| `NOP` | `NOP` | No operation |

## Example Programs

### Hello World (Calculator)

```glyph
// Calculate 42
LDI r0, 10
LDI r1, 32
ADD r0, r0, r1    // r0 = 10 + 32 = 42
HALT
```

### Loop Counter

```glyph
// Count from 0 to 9
LDI r0, 0         // counter
LDI r1, 10        // limit
LDI r2, 1         // increment

:loop
ADD r0, r0, r2    // counter++
BLT r0, r1, :loop // if counter < 10, loop

// r0 = 10 when done
HALT
```

### Memory Operations

```glyph
// Store and load a value
LDI r0, 12345
LDI r1, 0x1000    // memory address
STORE [r1], r0    // mem[0x1000] = 12345
LOAD r2, [r1]     // r2 = 12345
HALT
```

### Fibonacci

```glyph
// Calculate fib(10) = 55
LDI r0, 0         // fib(n-2)
LDI r1, 1         // fib(n-1)
LDI r2, 0         // result
LDI r3, 10        // count
LDI r4, 0         // counter
LDI r5, 1         // increment

:fib_loop
ADD r2, r0, r1    // result = fib(n-2) + fib(n-1)
MOV r0, r1        // shift
MOV r1, r2
ADD r4, r4, r5    // counter++
BLT r4, r3, :fib_loop

// r2 = 55 when done
HALT
```

### Self-Modification

```glyph
// Write a value to code memory
LDI r0, 0xDEAD
LDI r1, 100       // address to modify
STORE [r1], r0    // self-modify!
HALT
```

## Memory Layout

The VM has a flat 64KB address space:

| Range | Purpose |
|-------|---------|
| `0x0000 - 0x00FF` | Code (entry point at 0) |
| `0x0100 - 0x01FF` | Data segment |
| `0x0200 - 0x02FF` | Mailbox (I/O) |
| `0x1000 - 0xFFFF` | General purpose RAM |

## Registers

- 32 general-purpose registers: `r0` through `r31`
- `r0` is NOT special (not hardwired to zero)
- All registers are 32-bit unsigned integers

## Labels

Labels mark positions in code:

```glyph
:start
LDI r0, 1
JMP :start        // infinite loop
```

Labels can be used with:
- `JMP :label`
- `BEQ r1, r2, :label`
- `BNE r1, r2, :label`
- etc.

## Comments

```glyph
// This is a comment
LDI r0, 42  // inline comment
```

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│  PYTHON GLYPH VM ARCHITECTURE                               │
│                                                              │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │  .glyph     │───▶│  Compiler   │───▶│  Bytecode   │     │
│  │  Assembly   │    │  (Python)   │    │  (pixels)   │     │
│  └─────────────┘    └─────────────┘    └─────────────┘     │
│                                               │              │
│                                               ▼              │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │   Output    │◀───│    VM       │◀───│   Memory    │     │
│  │  (stdout)   │    │  Executor   │    │   (64KB)    │     │
│  └─────────────┘    └─────────────┘    └─────────────┘     │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

## Comparison to GPU Version

| Feature | Python VM | GPU Shader |
|---------|-----------|------------|
| Speed | ~1000 ops/sec | ~1B ops/sec |
| Visuals | Text output | 60 FPS rendering |
| Crashes | None | GPU hang (rare) |
| Debug | Easy (print) | Hard (shader) |
| Use case | Development | Production |

**Workflow:**
1. Write and test in Python VM
2. Debug and iterate quickly
3. Deploy same .glyph file to GPU

## The Sovereignty Connection

The Python VM is part of the **Sovereignty Ladder**:

```
Level 0: CPU controls everything (traditional)
    ↓
Level 5: Python VM runs Glyph (this tool)
    ↓
Level 10: Self-hosting editor on GPU
    ↓
Level 11: Full GPU sovereignty
```

This tool lets you climb the ladder **without Rust crashes**.

## File Location

```
systems/glyph_stratum/glyph_vm.py
```

## Future Enhancements

- [ ] Visual output (terminal graphics)
- [ ] Step-by-step debugging
- [ ] Breakpoints
- [ ] Memory inspector
- [ ] Multi-VM support (SPATIAL_SPAWN)
- [ ] Atlas/DRAW visualization

## Philosophy

> "Pixels Move Pixels"

This VM exists because:
1. Programming languages are abstractions over abstractions
2. Glyph is direct: one pixel = one instruction
3. You should be able to program with the medium itself
4. Compilation crashes should not block creativity

The Python VM is a bridge. It lets you think in pixels before you run on silicon.

---

*Last updated: 2026-03-18*
*Part of Geometry OS - The Sovereignty Ladder*
