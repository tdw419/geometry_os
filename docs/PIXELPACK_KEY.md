# PixelPack Hex Key v2

> 16 hex chars. Each one means something. String them together to make visuals.

## The Rule

```
Parity determines type:
  Even digits (0,2,4,6,8) = COORDINATES (spatial)
  Odd digits  (1,3,5,7,9) = COLORS (visual)
  Letters     (A,B,C,D,E,F) = OPCODES (actions)
```

## The Key

```
┌─────┬──────────┬─────────────────────────────────────┐
│ Hex │ Type     │ Value                                │
├─────┼──────────┼─────────────────────────────────────┤
│  0  │ Coord    │ 0   (top-left edge)                  │
│  1  │ Color    │ Black   (0x000000)                   │
│  2  │ Coord    │ 64  (quarter)                        │
│  3  │ Color    │ Red     (0xFF0000)                   │
│  4  │ Coord    │ 128 (center)                         │
│  5  │ Color    │ Green   (0x00FF00)                   │
│  6  │ Coord    │ 192 (three-quarter)                  │
│  7  │ Color    │ Blue    (0x0000FF)                   │
│  8  │ Coord    │ 255 (bottom-right edge)              │
│  9  │ Color    │ White   (0xFFFFFF)                   │
├─────┼──────────┼─────────────────────────────────────┤
│  A  │ Opcode   │ PSET   — draw pixel  (c, x, y)      │
│  B  │ Opcode   │ RECTF  — filled rect (c, x, y, w, h)│
│  C  │ Opcode   │ LINE   — draw line  (c,x1,y1,x2,y2) │
│  D  │ Opcode   │ FILL   — fill screen (c)             │
│  E  │ Opcode   │ FRAME  — present buffer (no params)  │
│  F  │ Opcode   │ HALT   — end program  (no params)    │
└─────┴──────────┴─────────────────────────────────────┘
```

## How It Works

Read the hex string left-to-right. When you hit an opcode letter, consume the
next N characters as its parameters:

| Opcode | Params | Example                      | Decoded                              |
|--------|--------|------------------------------|--------------------------------------|
| A      | c x y  | `A300`                       | Red pixel at (0, 0)                  |
| B      | c x y w h | `B30044`                  | Red rect at (0,0) size 128x128      |
| C      | c x1 y1 x2 y2 | `C90484`             | White line from (128,0) to (128,255) |
| D      | c      | `D3`                         | Fill screen red                      |
| E      | —      | `E`                          | Present buffer                       |
| F      | —      | `F`                          | Stop                                 |

## Coercion (when types don't match)

Sometimes a param slot needs a coord but you have a color, or vice versa.
The decoder coerces:

```
Color → Coord (when coord expected):
  1(Black)→0    3(Red)→64    5(Green)→128    7(Blue)→192    9(White)→255

Coord → Color (when color expected):
  0→0x000000   2→0x330000   4→0x663300   6→0x996600   8→0xCC9900
```

This means any hex string is ALWAYS valid -- every character maps to something.

## Coordinate Grid

The 5 coordinate values create a 5x5 grid on the 256px screen:

```
    0    64   128   192   255
 0  ┼─────┼──────┼─────┼────┤
    │  Q1  │  Q2   │ Q3  │ Q4│
64  ┼─────┼──────┼─────┼────┤
    │  Q5  │  Q6   │ Q7  │ Q8│
128 ┼─────┼──────┼─────┼────┤
    │  Q9  │ Q10   │ Q11 │Q12│
192 ┼─────┼──────┼─────┼────┤
    │ Q13  │ Q14   │ Q15 │Q16│
255 ┼─────┼──────┼─────┼────┘
```

## Design Space

- A 10-character hex string = 16^10 ≈ 1.1 trillion possible programs
- A 6-character string (one RECTF + FRAME + HALT) = 16^6 ≈ 16.7 million
- Minimum program: `D3EF` = fill red, frame, halt (4 chars)
- Four quadrants: `B30044EB50044EB74044EB94444EF` (30 chars)

## Philosophy

1. **Parity = semantics.** Even is spatial, odd is visual. This is the rule.
2. **Every string is valid.** Coercion means no syntax errors.
3. **One char = one mutation.** Flip any nibble, get a different image.
4. **Composability.** Chain commands like sentences: `D1EB30044EC90484EF`
