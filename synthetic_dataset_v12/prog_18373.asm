; DESCRIPTION: Draws a purple circle centered at (256, 41) with radius 37.
; PLAN: r0=256(x), r1=41(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 41
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
