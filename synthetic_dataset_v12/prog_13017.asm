; DESCRIPTION: Draws a purple circle centered at (303, 183) with radius 69.
; PLAN: r0=303(x), r1=183(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 183
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
