; DESCRIPTION: Draws a orange circle centered at (244, 136) with radius 30.
; PLAN: r0=244(x), r1=136(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 136
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
