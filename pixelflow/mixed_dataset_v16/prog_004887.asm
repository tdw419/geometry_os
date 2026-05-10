; DESCRIPTION: Draws a purple circle centered at (85, 85) with radius 44.
; PLAN: r0=85(x), r1=85(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 85
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
