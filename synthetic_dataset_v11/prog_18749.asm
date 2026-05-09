; DESCRIPTION: Draws a purple circle centered at (78, 157) with radius 71.
; PLAN: r0=78(x), r1=157(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 157
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
