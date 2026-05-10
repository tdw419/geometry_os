; DESCRIPTION: Draws a magenta circle centered at (56, 172) with radius 21.
; PLAN: r0=56(x), r1=172(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 172
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
