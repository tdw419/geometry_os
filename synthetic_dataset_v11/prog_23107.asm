; DESCRIPTION: Draws a blue circle centered at (185, 137) with radius 36.
; PLAN: r0=185(x), r1=137(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 137
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
