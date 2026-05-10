; DESCRIPTION: Draws a purple circle centered at (351, 82) with radius 23.
; PLAN: r0=351(x), r1=82(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 82
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
