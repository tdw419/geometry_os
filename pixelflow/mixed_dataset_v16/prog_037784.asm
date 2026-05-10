; DESCRIPTION: Draws a blue circle centered at (141, 119) with radius 23.
; PLAN: r0=141(x), r1=119(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 119
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
