; DESCRIPTION: Draws a purple circle centered at (299, 98) with radius 31.
; PLAN: r0=299(x), r1=98(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 98
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
