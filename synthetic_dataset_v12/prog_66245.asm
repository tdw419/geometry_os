; DESCRIPTION: Draws a purple circle centered at (477, 46) with radius 11.
; PLAN: r0=477(x), r1=46(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 46
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
