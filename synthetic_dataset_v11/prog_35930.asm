; DESCRIPTION: Draws a white circle centered at (159, 122) with radius 69.
; PLAN: r0=159(x), r1=122(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 122
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
