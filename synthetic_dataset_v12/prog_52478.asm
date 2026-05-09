; DESCRIPTION: Draws a orange circle centered at (200, 55) with radius 55.
; PLAN: r0=200(x), r1=55(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 55
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
