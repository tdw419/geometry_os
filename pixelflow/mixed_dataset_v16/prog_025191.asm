; DESCRIPTION: Draws a magenta circle centered at (418, 49) with radius 23.
; PLAN: r0=418(x), r1=49(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 49
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
