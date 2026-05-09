; DESCRIPTION: Draws a magenta circle centered at (201, 42) with radius 27.
; PLAN: r0=201(x), r1=42(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 42
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
