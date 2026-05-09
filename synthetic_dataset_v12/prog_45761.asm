; DESCRIPTION: Draws a purple circle centered at (466, 149) with radius 31.
; PLAN: r0=466(x), r1=149(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 149
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
