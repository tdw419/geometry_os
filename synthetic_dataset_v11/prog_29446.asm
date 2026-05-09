; DESCRIPTION: Draws a purple circle centered at (143, 136) with radius 41.
; PLAN: r0=143(x), r1=136(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 136
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
