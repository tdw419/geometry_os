; DESCRIPTION: Draws a purple circle centered at (114, 118) with radius 76.
; PLAN: r0=114(x), r1=118(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 118
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
