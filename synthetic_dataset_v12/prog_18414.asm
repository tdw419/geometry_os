; DESCRIPTION: Draws a blue circle centered at (253, 51) with radius 22.
; PLAN: r0=253(x), r1=51(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 51
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
