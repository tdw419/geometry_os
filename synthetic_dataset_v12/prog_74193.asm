; DESCRIPTION: Draws a blue circle centered at (351, 121) with radius 66.
; PLAN: r0=351(x), r1=121(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 121
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
