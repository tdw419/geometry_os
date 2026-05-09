; DESCRIPTION: Draws a purple circle centered at (331, 125) with radius 69.
; PLAN: r0=331(x), r1=125(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 125
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
