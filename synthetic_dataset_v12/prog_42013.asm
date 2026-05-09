; DESCRIPTION: Draws a purple circle centered at (293, 165) with radius 69.
; PLAN: r0=293(x), r1=165(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 165
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
