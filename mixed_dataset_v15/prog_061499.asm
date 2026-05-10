; DESCRIPTION: Draws a magenta circle centered at (312, 157) with radius 36.
; PLAN: r0=312(x), r1=157(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 157
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
