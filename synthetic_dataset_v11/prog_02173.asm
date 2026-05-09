; DESCRIPTION: Draws a purple circle centered at (90, 76) with radius 71.
; PLAN: r0=90(x), r1=76(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 76
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
