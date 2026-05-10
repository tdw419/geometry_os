; DESCRIPTION: Draws a blue circle centered at (101, 88) with radius 26.
; PLAN: r0=101(x), r1=88(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 88
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
