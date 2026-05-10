; DESCRIPTION: Draws a blue circle centered at (119, 153) with radius 39.
; PLAN: r0=119(x), r1=153(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 153
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
