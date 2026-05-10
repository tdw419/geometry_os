; DESCRIPTION: Draws a purple circle centered at (377, 106) with radius 75.
; PLAN: r0=377(x), r1=106(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 106
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
