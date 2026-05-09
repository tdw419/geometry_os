; DESCRIPTION: Draws a purple circle centered at (430, 73) with radius 26.
; PLAN: r0=430(x), r1=73(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 73
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
