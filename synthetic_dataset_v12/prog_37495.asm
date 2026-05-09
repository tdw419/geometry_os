; DESCRIPTION: Draws a purple circle centered at (432, 79) with radius 64.
; PLAN: r0=432(x), r1=79(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 79
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
