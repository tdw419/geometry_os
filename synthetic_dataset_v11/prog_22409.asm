; DESCRIPTION: Draws a purple circle centered at (100, 138) with radius 15.
; PLAN: r0=100(x), r1=138(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 138
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
