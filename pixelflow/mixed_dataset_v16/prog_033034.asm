; DESCRIPTION: Draws a blue circle centered at (334, 99) with radius 35.
; PLAN: r0=334(x), r1=99(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 99
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
