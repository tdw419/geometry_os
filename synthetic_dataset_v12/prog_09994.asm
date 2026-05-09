; DESCRIPTION: Draws a purple circle centered at (115, 69) with radius 17.
; PLAN: r0=115(x), r1=69(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 69
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
