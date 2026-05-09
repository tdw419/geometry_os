; DESCRIPTION: Draws a magenta circle centered at (78, 32) with radius 31.
; PLAN: r0=78(x), r1=32(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 32
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
