; DESCRIPTION: Draws a purple circle centered at (361, 55) with radius 55.
; PLAN: r0=361(x), r1=55(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 55
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
