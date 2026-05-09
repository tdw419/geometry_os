; DESCRIPTION: Draws a purple circle centered at (77, 136) with radius 25.
; PLAN: r0=77(x), r1=136(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 136
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
