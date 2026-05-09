; DESCRIPTION: Draws a blue circle centered at (76, 115) with radius 69.
; PLAN: r0=76(x), r1=115(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 115
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
