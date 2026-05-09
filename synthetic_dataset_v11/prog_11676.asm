; DESCRIPTION: Draws a purple circle centered at (134, 86) with radius 75.
; PLAN: r0=134(x), r1=86(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 86
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
