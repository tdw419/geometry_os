; DESCRIPTION: Draws a purple circle centered at (196, 170) with radius 66.
; PLAN: r0=196(x), r1=170(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 170
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
