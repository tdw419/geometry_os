; DESCRIPTION: Draws a blue circle centered at (141, 22) with radius 35.
; PLAN: r0=141(x), r1=22(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 22
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
