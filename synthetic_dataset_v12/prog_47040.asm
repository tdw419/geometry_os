; DESCRIPTION: Draws a purple circle centered at (438, 76) with radius 61.
; PLAN: r0=438(x), r1=76(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 76
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
