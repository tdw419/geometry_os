; DESCRIPTION: Draws a purple circle centered at (225, 157) with radius 69.
; PLAN: r0=225(x), r1=157(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 157
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
