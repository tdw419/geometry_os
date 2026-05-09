; DESCRIPTION: Draws a blue circle centered at (216, 137) with radius 10.
; PLAN: r0=216(x), r1=137(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 137
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
