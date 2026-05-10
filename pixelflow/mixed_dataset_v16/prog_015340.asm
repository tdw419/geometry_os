; DESCRIPTION: Draws a purple circle centered at (216, 26) with radius 23.
; PLAN: r0=216(x), r1=26(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 26
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
