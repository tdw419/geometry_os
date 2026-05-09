; DESCRIPTION: Draws a purple circle centered at (98, 99) with radius 75.
; PLAN: r0=98(x), r1=99(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 99
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
