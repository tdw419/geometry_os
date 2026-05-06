# Geometry OS Standard Library (lib/)

Assembly library for the GeOS VM. All functions follow a consistent calling convention
and can be included via `.include "lib/filename.asm"` or `.lib filename`.

## Calling Convention

| Category      | Registers             |
|---------------|-----------------------|
| Arguments     | r1–r5 (r0 = return)   |
| Caller-saved  | r1–r9                 |
| Callee-saved  | r10–r25               |
| Temp/preproc  | r27–r29               |
| Stack Pointer | r30                   |
| Return PC     | r31                   |

- **Return value**: always in `r0`
- **Boolean functions**: return `1` (true) or `0` (false)
- **Error values**: `0` for failure (e.g. malloc out-of-memory)
- **String format**: null-terminated, one ASCII character per u32 word (low byte)

## Include Order

```
.include "lib/stdlib.asm"   ; core: strings, memory, heap (no deps)
.include "lib/math.asm"     ; math ops (no deps)
.include "lib/time.asm"     ; tick/delay (no deps)
.include "lib/collision.asm"; collision detection (no deps)
.include "lib/stdio.asm"    ; screen I/O (requires stdlib.asm)
.include "lib/heap.asm"     ; advanced heap (no deps, but uses r0 convention)
```

> **Note**: `heap.asm` uses a different calling convention (r0 = argument)
> compared to other library files (r1–r5 = arguments). This is a known
> inconsistency from the bump allocator's evolution.

## lib/stdlib.asm — Strings, Memory, Heap (Bump)

### String Operations

| Function | Signature | Description |
|----------|-----------|-------------|
| `strlen` | `r1=addr` → `r0=len` | Length of null-terminated string |
| `strcmp` | `r1=a, r2=b` → `r0` | Compare strings: 0=equal, 1=A>B, -1=A<B |
| `strcpy` | `r1=dst, r2=src` → `r0=dst` | Copy string (returns dst) |
| `strcat` | `r1=dst, r2=src` → `r0=dst` | Append src to dst |

### Memory Operations

| Function | Signature | Description |
|----------|-----------|-------------|
| `memset` | `r1=addr, r2=count, r3=value` → `r0=addr` | Fill N words with value |
| `memcpy` | `r1=dst, r2=src, r3=count` → `r0=dst` | Copy N words |

### Integer Conversion

| Function | Signature | Description |
|----------|-----------|-------------|
| `itoa` | `r1=value, r2=buf` → `r0=buf` | Unsigned int → decimal string |

### Bump Allocator (in stdlib.asm)

| Function | Signature | Description |
|----------|-----------|-------------|
| `malloc` | `r1=words` → `r0=addr` | Allocate from 0xC000 bump region (0=OOM) |
| `free` | `r1=addr` | No-op (bump allocator) |

## lib/math.asm — Math Primitives

| Function | Signature | Description |
|----------|-----------|-------------|
| `abs` | `r1=val` → `r0=\|val\|` | Absolute value (2's complement negation) |
| `min` | `r1=a, r2=b` → `r0=min(a,b)` | Minimum of two values |
| `max` | `r1=a, r2=b` → `r0=max(a,b)` | Maximum of two values |
| `clamp` | `r1=val, r2=lo, r3=hi` → `r0=clamped` | Clamp value to [lo, hi] |
| `sqrt_approx` | `r1=val` → `r0=floor(sqrt)` | Integer sqrt via Newton's method (≤16 iter) |
| `dist2` | `r1=x1, r2=y1, r3=x2, r4=y2` → `r0=dx²+dy²` | Squared Euclidean distance |

## lib/time.asm — Timing

| Function | Signature | Description |
|----------|-----------|-------------|
| `get_ticks` | (none) → `r0=ticks` | Read hardware tick counter (RAM[0xFFE]) |
| `delay_ticks` | `r1=n` | Busy-wait N ticks |
| `delay_frames` | `r1=n` | Sleep N frames (uses SLEEP opcode) |

## lib/collision.asm — Collision Detection

All return 1=true, 0=false. Use squared distance to avoid sqrt.

| Function | Signature | Description |
|----------|-----------|-------------|
| `rect_overlap` | `r1=x1,r2=y1,r3=w1,r4=h1, r5=x2,r6=y2,r7=w2,r8=h2` → `r0` | AABB overlap test |
| `point_in_rect` | `r1=px,r2=py, r3=rx,r4=ry,r5=rw,r6=rh` → `r0` | Point-in-rectangle |
| `point_in_circle` | `r1=px,r2=py,r3=cx,r4=cy,r5=cr` → `r0` | Point-in-circle |
| `circle_rect_intersect` | `r1=cx,r2=cy,r3=cr, r4=rx,r5=ry,r6=rw,r7=rh` → `r0` | Circle-rect intersection |
| `circles_overlap` | `r1=cx1,r2=cy1,r3=r1,r4=cx2,r5=cy2,r6=r2` → `r0` | Circle-circle overlap |
| `point_in_triangle` | `r1=px,r2=py, r3=x1,r4=y1,r5=x2,r6=y2,r7=x3,r8=y3` → `r0` | Barycentric point-in-triangle |

## lib/stdio.asm — Screen Text I/O

Requires `stdlib.asm` (for `strlen`, `itoa`).

Uses cursor state stored in RAM:
- `0xFB0` = cursor X position
- `0xFB1` = cursor Y position
- `0xFB2` = text color (default white)

| Function | Signature | Description |
|----------|-----------|-------------|
| `stdio_init` | (none) | Initialize cursor (x=2, y=0, color=white) |
| `print_str` | `r1=addr` | Print null-terminated string at cursor, advance cursor |
| `print_int` | `r1=value` | Print unsigned integer as decimal |
| `print_newline` | (none) | Advance cursor to next line |

Internal scratch: `0xFB4`–`0xFB9` (itoa buffer + temp char).

## lib/heap.asm — Advanced Heap Allocator

Uses a **different calling convention**: r0 = argument (not r1).

| Function | Signature | Description |
|----------|-----------|-------------|
| `_lib_heap_init` | (none) | Initialize heap pointer to 0xC004 |
| `_lib_heap_alloc` | `r0=words` → `r0=addr` | Allocate with [size][0xDEAD][data...] header |
| `_lib_heap_free` | `r0=addr` | No-op (bump allocator) |
| `_lib_heap_available` | (none) → `r0=free_words` | Remaining free words |

Memory layout: 0xC000 = heap pointer, 0xC004–0xDFFF = heap data (16KB).

## Test Coverage

Run the library test suite:
```
load lib_test
run
```

See `programs/lib_test.asm` for comprehensive tests of all library functions.
Each test prints PASS/FAIL to screen and displays a summary count at the end.
