; DESCRIPTION: Draws a purple circle centered at (85, 194) with radius 53.
; PLAN: r0=85(x), r1=194(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 194
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
