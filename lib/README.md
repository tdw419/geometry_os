# Geometry OS Standard Library (lib/)

Assembly library modules for the Geometry OS VM. Include with `.lib name` or `.include "lib/name.asm"`.

## Modules

| Module | Description | Dependencies |
|--------|-------------|-------------|
| `stdlib` | Strings, memory ops, heap allocator (bump) | none |
| `math` | abs, min, max, clamp, lerp, sqrt, dist2 | none |
| `collision` | rect/circle/triangle overlap tests | none |
| `time` | tick counter, delay functions | none |
| `stdio` | Screen text output (cursor-based) | stdlib |
| `heap` | Advanced heap with header tracking | none |
| `draw` | Screen drawing wrappers (boxes, patterns) | none |
| `input` | Keyboard/mouse polling helpers | none |
| `random` | PRNG (xorshift32), random range | none |
| `gfx` | Pixel manipulation (swap, blend, pack RGBA) | none |

## Calling Convention

```
Arguments:   r1-r8 (r0 = return value / CMP result)
Caller-saved: r1-r9  (may be clobbered by any CALL)
Callee-saved: r10-r25 (functions MUST preserve these via PUSH/POP)
Temp/reserved: r27-r29 (preprocessor), r30=SP, r31=return PC
```

## String Format

Null-terminated, one character per u32 word (low byte). Example: "Hi\0" = [0x48, 0x69, 0x00].

## Memory Map (Library Reserved)

```
0xC000-0xDFFF  Heap region (stdlib bump allocator)
0xE000-0xEFFF  Extended heap (lib/heap header-tracked)
0xFB0          Cursor X (stdio)
0xFB1          Cursor Y (stdio)
0xFB2          Cursor color (stdio)
0xFB4-0xFBB    stdio print_int buffer (8 words)
0xFB8-0xFB9    stdio temp char storage
0xF80-0xFB7    Test result area (56 slots, 1=pass, 0=fail)
0xFFE          Tick counter (hardware, incremented each frame)
```

## Usage

```asm
; Include individual modules
.lib stdlib
.lib math
.lib collision
.lib stdio        ; must come after stdlib

; Or use explicit include paths
.include "lib/stdlib.asm"
.include "lib/math.asm"
```

## Adding a New Module

1. Create `lib/modulename.asm` with standardized header (see existing files)
2. Document all functions with: arguments, return, clobbers, algorithm
3. Only use caller-saved registers (r1-r9) unless PUSH/POP used
4. Add test coverage in `programs/lib_test_v4.asm`
5. Update this README

## Version

All modules are at v1.2.0. Header format is consistent across all files.
