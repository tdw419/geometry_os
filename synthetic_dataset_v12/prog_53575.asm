; DESCRIPTION: Draws a orange circle centered at (230, 140) with radius 69.
; PLAN: r0=230(x), r1=140(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 140
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
