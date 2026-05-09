; DESCRIPTION: Draws a purple circle centered at (158, 99) with radius 72.
; PLAN: r0=158(x), r1=99(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 99
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
