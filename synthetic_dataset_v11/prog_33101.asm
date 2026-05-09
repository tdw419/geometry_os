; DESCRIPTION: Draws a blue circle centered at (122, 157) with radius 69.
; PLAN: r0=122(x), r1=157(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 157
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
