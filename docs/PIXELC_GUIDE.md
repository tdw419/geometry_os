# pixelc: Write Geometry OS Programs in Python

## What This Is

pixelc is a compiler that turns familiar Python-like code into pixel bytecode that runs on the Geometry OS VM. You write Python, the VM runs pixels. No .gasm mnemonics needed.

```
your code (.gp) --> pixelc --> .gasm --> assembler --> pixel bytes --> VM
```

## Where Things Live

| File | Purpose |
|------|---------|
| `tools/pixelc` | The compiler (single Python script, no dependencies) |
| `programs/*.gp` | Source files written in Python-like syntax |
| `programs/*.asm` | Compiled output (.gasm assembly) |
| `tests/pixelc_tests.rs` | Rust tests that compile, assemble, and run .gp programs on the VM |

## Quick Start

Write a program:

```python
# programs/hello_pixels.gp
x = 0
while x < 50:
    y = 0
    while y < 50:
        pixel(x, y, x + y)
        y = y + 1
    x = x + 1
halt()
```

Compile it:

```bash
python3 tools/pixelc programs/hello_pixels.gp -o programs/hello_pixels.asm
```

Run it on the VM (copy to boot.asm, press F8 in the GUI):

```bash
cp programs/hello_pixels.asm programs/boot.asm
# Press F8 in the running window
```

Or test it programmatically:

```rust
// In tests/pixelc_tests.rs
let vm = compile_run("programs/hello_pixels.asm");
assert!(vm.halted);
assert_eq!(vm.regs[0], 50); // x reached 50
```

## Syntax Reference

### Variables

Variables are auto-allocated to registers r0-r27. First assignment creates the register.

```python
x = 42           # LDI r0, 42
y = x + 8        # compile-time allocation to r1
z = x * y        # r2 = r0 * r1
x = x + 1        # works -- compiler handles the clobber case
x += 1            # shorthand for x = x + 1
```

Supported compound assignments: `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`

### Arithmetic and Bitwise

```python
a = x + y        # ADD
a = x - y        # SUB
a = x * y        # MUL
a = x / y        # DIV
a = x % y        # MOD
a = x & y        # AND
a = x | y        # OR
a = x ^ y        # XOR
a = ~x           # NOT
a = x << 3       # SHL
a = x >> 3       # SHR
a = -x           # negation (0 - x)
```

### Memory Access

```python
ram[100] = 42     # STORE -- write 42 to address 100
val = ram[addr]   # LOAD -- read from address in variable 'addr'
```

Addresses and values can be expressions:

```python
ram[x + 100] = y * 2
val = ram[base + offset]
```

### Drawing

```python
pixel(x, y, color)       # PSET -- draw one pixel
rect(x, y, w, h)         # RECTF -- filled rectangle
circle(cx, cy, radius)   # CIRCLEF -- filled circle
line(x1, y1, x2, y2)     # LINE -- draw line
```

All arguments are expressions. The compiler evaluates them into scratch registers automatically.

### Control Flow

**if/else** (indentation matters, just like Python):

```python
if x > 5:
    pixel(x, 0, 0x41)
else:
    pixel(x, 0, 0x20)
```

**while loops**:

```python
while x < 100:
    pixel(x, x, 0x41)
    x = x + 1
```

**Comparison operators**: `==`, `!=`, `<`, `>`, `<=`, `>=`

Behind the scenes, comparisons become conditional branches. The compiler inverts the condition and jumps past the body if false.

### Functions

```python
fn add(a, b):
    return a + b

# Calling:
result = add(x, y)
```

Functions receive arguments in r0, r1, etc. Return value goes in r0. Functions are emitted before `main:` so the VM can call them.

### Built-in Functions

| Function | Maps To | Description |
|----------|---------|-------------|
| `halt()` | HALT | Stop execution |
| `yield()` | YIELD | End frame (for animations) |
| `nop()` | NOP | Do nothing |
| `fork()` | FORK | Clone current process |
| `spawn(addr, arg)` | SPAWN | Start child VM |
| `send()` | SEND | Send message (IPC) |
| `recv()` | RECV | Receive message (IPC) |
| `push(val)` | PUSH | Push to stack |
| `pop()` | POP | Pop from stack |
| `pixel(x, y, c)` | PSET | Draw pixel |
| `rect(x, y, w, h)` | RECTF | Filled rectangle |
| `circle(cx, cy, r)` | CIRCLEF | Filled circle |
| `line(x1, y1, x2, y2)` | LINE | Draw line |
| `text(x, y, addr)` | TEXT | Draw text string |

### Comments

```python
# This is a comment
x = 42  # inline comment
```

### Number Formats

```python
x = 42          # decimal
x = 0xFF        # hexadecimal
x = 0x41        # hex (65 decimal, also ASCII 'A')
```

## How the Compiler Works

### Register Allocation

Variables get registers on first assignment, in order:

```python
x = 10   # x -> r0
y = 20   # y -> r1
z = 0    # z -> r2
```

Max 28 variables (r0-r27). r28-r30 are scratch registers used for expression evaluation. r31 is always zero.

### Expression Evaluation

Binary operations (like `x + y`) use two scratch registers from a stack:

```
push r28, evaluate left into r28
push r29, evaluate right into r29
ADD r28, r29
MOV target, r28
pop 2
```

This prevents clobbering when the target register also appears in the expression (e.g. `dx = 0 - dx`).

### Scratch Register Stack

The compiler uses a push/pop stack for scratch registers (r28, r29, r30). This gives 3 levels of nesting. Most programs only need 1-2 levels.

If you hit "Out of scratch registers", simplify the expression by splitting it:

```python
# Too deep for 3 scratch registers:
z = (a + b) * (c + d) + (e * f)

# Split it:
t1 = a + b
t2 = c + d
z = t1 * t2 + e * f
```

### Branch Generation

Comparisons in `if` and `while` generate inverted branches:

```
if x > 5:     becomes    BLE r_x, r_5, else_label    (branch if NOT greater)
    ...                   ...body...
else:                     JMP end_label
    ...                   else_label: ...body...
                          end_label:
```

The VM's branch conditions: BEQ(0), BNE(1), BLT(2), BGE(3), BLTU(4), BGEU(5), BAL(15).

## Example Programs

### Gradient fill

```python
y = 0
while y < 256:
    x = 0
    while x < 256:
        pixel(x, y, x)
        x = x + 1
    y = y + 1
halt()
```

### Bouncing ball

```python
x = 10
y = 10
dx = 3
dy = 2
steps = 0

while steps < 200:
    pixel(x, y, 0)           # erase old
    x = x + dx
    y = y + dy
    if x >= 200:
        dx = 0 - dx
        x = x + dx
    if y >= 200:
        dy = 0 - dy
        y = y + dy
    if x < 3:
        dx = 0 - dx
        x = x + dx
    if y < 3:
        dy = 0 - dy
        y = y + dy
    pixel(x, y, 0x41)        # draw new
    steps = steps + 1
halt()
```

### Counter with memory

```python
count = 0
while count < 10:
    ram[count] = count * 2
    count = count + 1
halt()
```

## Current Limitations

- **Max 28 variables** (r0-r27). Each unique variable name gets one register.
- **Max 3 expression nesting levels** (r28-r30 scratch). Split complex expressions.
- **No string literals** in code. Use `text(x, y, addr)` with a pre-loaded address.
- **No else-if chains.** Use nested `if`/`else` instead.
- **No negative literals.** Use `0 - N` instead of `-N`.
- **No arrays or structs.** Use `ram[base + offset]` for manual memory layout.
- **No for loops.** Use `while` with a counter.
- **All values are u32.** The VM uses signed comparison for BLT/BGE but unsigned for BLTU/BGEU.
- **Functions share the variable namespace.** Function params get their own registers but count toward the 28-variable limit.

## Troubleshooting

**"Out of registers"**: Too many variables. Use fewer, or reuse names.

**"Out of scratch registers"**: Expression too deeply nested. Split into intermediate variables.

**"Unexpected char"**: Syntax error in your .gp file. Check the line number in the error.

**"Unknown comparison"**: Only `==`, `!=`, `<`, `>`, `<=`, `>=` are supported.

**"Unknown function"**: Check the built-in list above. User functions must be defined with `fn name():` before the call.

**"assembly failed"**: The generated .gasm has an issue. Run `python3 tools/pixelc file.gp` to see the output and check for invalid instructions.

## Why This Exists

The Geometry OS VM runs pixels. Opcodes are ASCII bytes. Programming it directly means writing `.gasm` assembly with mnemonics like `LDI r0, 42` and packed branch conditions like `BRANCH (2<<24)|(0<<16)|1, @loop`.

AI models don't know .gasm. They know Python. pixelc bridges the gap: write what you know, get pixels out. The keystroke-to-pixel identity is preserved -- pixelc is a host-side tool, just like the assembler. The VM never knows or cares what generated its bytecode.

The goal: write Geometry OS programs without writing Rust, without memorizing a custom ISA, and without hallucinating opcodes that don't exist.
