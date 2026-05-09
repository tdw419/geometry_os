; DESCRIPTION: Draws a orange circle centered at (62, 136) with radius 16.
; PLAN: r0=62(x), r1=136(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 136
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
