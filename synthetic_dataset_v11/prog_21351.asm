; DESCRIPTION: Draws a orange circle centered at (120, 136) with radius 55.
; PLAN: r0=120(x), r1=136(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 136
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
