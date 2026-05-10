; DESCRIPTION: Draws a magenta circle centered at (428, 170) with radius 22.
; PLAN: r0=428(x), r1=170(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 170
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
