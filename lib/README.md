# GeOS Assembly Standard Library (`lib/`)

**Version:** 1.2.0  
**License:** Project-internal

## Overview

The GeOS assembly standard library provides reusable routines for string manipulation, memory operations, math, collision detection, timing, formatted I/O, and heap allocation. All functions follow a consistent calling convention and are designed for the GeOS 32-bit register-based VM.

## Files

| File | Description | Dependencies |
|------|-------------|-------------|
| `stdlib.asm` | String ops, memory ops, bump allocator | None (base) |
| `math.asm` | Arithmetic: abs, min, max, clamp, lerp, sqrt, dist² | None |
| `collision.asm` | AABB, point-in-*, circle/rect intersection | None |
| `time.asm` | Tick counter, delay utilities | None |
| `stdio.asm` | Screen text output with cursor management | `stdlib.asm` (strlen, itoa) |
| `heap.asm` | Advanced bump allocator with header tracking | None |

## Calling Convention

```
Arguments:  r1-r8 (r0 = return value)
Caller-saved:  r1-r9   (may be clobbered by callee)
Callee-saved:  r10-r25 (MUST be preserved by callee)
Temp/reserved: r27-r29 (preprocessor), r30=SP, r31=return PC
```

**All library functions preserve r10-r25.** Functions that internally need these registers use `PUSH`/`POP` (v1.2.0 fixed violations in `itoa`, `sqrt_approx`, `point_in_triangle`, `delay_ticks`, and `print_str`).

## String Format

Null-terminated, one character per u32 word (low byte).  
Example: `"Hi"` → `[0x48, 0x69, 0x00]` (3 words)

## Usage

Include from assembly with `.include`:

```asm
.org 0x500
.include "lib/stdlib.asm"
.include "lib/math.asm"
.include "lib/collision.asm"
.include "lib/time.asm"
.include "lib/stdio.asm"    ; must come AFTER stdlib.asm
.include "lib/heap.asm"
```

## Function Reference

### stdlib.asm — String & Memory Operations

| Function | Args | Returns | Clobbers | Description |
|----------|------|---------|----------|-------------|
| `strlen` | r1=addr | r0=len | r2 | String length (before null) |
| `strcmp` | r1=a, r2=b | r0=0/1/-1 | r3,r4,r5 | String compare |
| `strcpy` | r1=dst, r2=src | r0=dst | r3 | String copy |
| `strncpy` | r1=dst, r2=src, r3=n | r0=dst | r4,r5 | Bounded copy with null-pad |
| `strcat` | r1=dst, r2=src | r0=dst | r3 | String concatenation |
| `memset` | r1=addr, r2=count, r3=val | r0=addr | r4 | Fill memory region |
| `memcpy` | r1=dst, r2=src, r3=count | r0=dst | r4 | Copy memory region |
| `memchr` | r1=addr, r2=count, r3=val | r0=ptr/0 | r4 | Find byte in region |
| `itoa` | r1=value, r2=buf | r0=buf | r1-r9 | Integer to string |
| `atoi` | r1=addr | r0=value | r2,r3 | String to integer |
| `malloc` | r1=words | r0=addr/0 | r2-r6 | Bump allocator |
| `free` | r1=addr | — | none | No-op (bump allocator) |

**Heap:** `malloc` uses a bump allocator starting at `0xC000` (16KB). Memory is only reclaimed on process restart.

### math.asm — Arithmetic

| Function | Args | Returns | Clobbers | Description |
|----------|------|---------|----------|-------------|
| `abs` | r1=val | r0=\|val\| | r2 | Absolute value |
| `min` | r1=a, r2=b | r0=min | r3 | Minimum of two values |
| `max` | r1=a, r2=b | r0=max | r3 | Maximum of two values |
| `clamp` | r1=val, r2=lo, r3=hi | r0=clamped | r4 | Clamp to range |
| `lerp` | r1=a, r2=b, r3=t, r4=scale | r0=interpolated | r5 | Linear interpolation |
| `sqrt_approx` | r1=val | r0=√val | r1-r9 | Newton's method (16 iterations) |
| `dist2` | r1=x1, r2=y1, r3=x2, r4=y2 | r0=dist² | r5,r6 | Squared distance |

### collision.asm — Collision Detection

All functions return `r0=1` (true) or `r0=0` (false). Uses squared distance throughout (no SQRT needed).

| Function | Args | Returns | Clobbers | Description |
|----------|------|---------|----------|-------------|
| `rect_overlap` | r1-r4=rect1, r5-r8=rect2 | r0=0/1 | r9 | AABB overlap test |
| `point_in_rect` | r1=px,r2=py, r3-r6=rect | r0=0/1 | r7 | Point inside rectangle |
| `point_in_circle` | r1=px,r2=py, r3=cx,r4=cy,r5=cr | r0=0/1 | r8,r9 | Point inside circle |
| `circle_rect_intersect` | r1=cx,r2=cy,r3=cr, r4-r7=rect | r0=0/1 | r4-r9 | Circle-rect intersection |
| `circles_overlap` | r1=cx1,r2=cy1,r3=r1, r4=cx2,r5=cy2,r6=r2 | r0=0/1 | r8,r9 | Circle-circle overlap |
| `point_in_triangle` | r1=px,r2=py, r3-r8=triangle | r0=0/1 | r1-r9 | Point in triangle (barycentric) |

### time.asm — Timing

| Function | Args | Returns | Clobbers | Description |
|----------|------|---------|----------|-------------|
| `get_ticks` | — | r0=ticks | r9 | Read hardware tick counter |
| `delay_ticks` | r1=n | — | r1,r8,r9 | Busy-wait N ticks |
| `delay_frames` | r1=n | — | none | Sleep N frames |

**Tick counter:** Stored at RAM address `0xFFE`, incremented by the scheduler each tick.

### stdio.asm — Formatted I/O

Requires `stdlib.asm` to be included first (uses `strlen`, `itoa`).

| Function | Args | Returns | Clobbers | Description |
|----------|------|---------|----------|-------------|
| `stdio_init` | — | — | r0,r9 | Init cursor (x=2, y=0, white) |
| `print_str` | r1=addr | — | r2-r5,r8,r9 | Print string at cursor |
| `print_int` | r1=value | — | r2-r9 | Print integer as decimal |
| `print_newline` | — | — | r0,r3,r9 | Advance to next line |

**Cursor state** stored in RAM:
- `0xFB0` = cursor X
- `0xFB1` = cursor Y
- `0xFB2` = text color

**Internal buffers:** `0xFB4`-`0xFB7` (itoa buffer), `0xFB8`-`0xFB9` (char temp).

### heap.asm — Advanced Heap Allocator

Bump allocator with block headers. Requires `_lib_heap_init` before first allocation.

| Function | Args | Returns | Clobbers | Description |
|----------|------|---------|----------|-------------|
| `_lib_heap_init` | — | — | r0,r1 | Init heap pointer to 0xC004 |
| `_lib_heap_alloc` | r1=words | r0=ptr/0 | r1,r2,r4,r5 | Allocate with header |
| `_lib_heap_free` | r1=addr | — | none | No-op (bump allocator) |
| `_lib_heap_available` | — | r0=free | r1 | Remaining free words |

**Block layout:** `[size][0xDEAD][data...]`  
**Heap region:** `0xC004`–`0xDFFF` (≈16KB data)

## Testing

Run the test suite: `programs/lib_test_v3.asm`

```asm
; Load and run via VM canvas:
.org 0x500
.include "lib/stdlib.asm"
.include "lib/math.asm"
.include "lib/time.asm"
.include "lib/collision.asm"
```

Test results stored in RAM `0xF80`–`0xFB7` (1=PASS, 0=FAIL).  
56 tests covering:
- String operations (strlen, strcmp, strcpy, strncpy, itoa, atoi)
- Memory operations (memset, memcpy, memchr)
- Math (abs, min, max, clamp, lerp, sqrt_approx, dist2)
- Collision (rect_overlap, point_in_rect, point_in_circle, circle_rect_intersect, circles_overlap, point_in_triangle)
- Heap (malloc, callee-saved preservation)
- Callee-saved register preservation across all functions

**Note:** `stdio.asm` and `heap.asm` functions are not tested via RAM-only verification because they require screen output (TEXT opcode) or have complex state interactions. They are tested implicitly by programs that use them.

## Version History

### v1.2.0
- Fixed callee-saved register violations in `itoa` (stdlib.asm)
- Fixed callee-saved register violations in `sqrt_approx` (math.asm)
- Fixed callee-saved register violations in `point_in_triangle` (collision.asm)
- Fixed callee-saved register violations in `delay_ticks` (time.asm)
- Fixed callee-saved register violations in `print_str` (stdio.asm)
- Standardized all function documentation headers
- Added comprehensive test suite (56 tests)

### v1.1.0
- Added `strncpy`, `memchr`, `memchr`, `memset`, `memcpy`
- Added `circles_overlap`, `circle_rect_intersect`, `point_in_triangle`
- Added `lerp`, `sqrt_approx`, `dist2`
- Added `delay_frames`
- Added `stdio.asm` and `heap.asm`
