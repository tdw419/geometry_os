; DESCRIPTION: Draws a purple circle centered at (166, 102) with radius 69.
; PLAN: r0=166(x), r1=102(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 102
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
