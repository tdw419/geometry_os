; DESCRIPTION: Draws a purple circle centered at (122, 69) with radius 34.
; PLAN: r0=122(x), r1=69(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 69
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
