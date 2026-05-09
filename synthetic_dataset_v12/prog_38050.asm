; DESCRIPTION: Draws a magenta circle centered at (319, 42) with radius 38.
; PLAN: r0=319(x), r1=42(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 42
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
