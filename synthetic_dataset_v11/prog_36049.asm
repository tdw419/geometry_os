; DESCRIPTION: Draws a magenta circle centered at (128, 170) with radius 75.
; PLAN: r0=128(x), r1=170(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 170
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
