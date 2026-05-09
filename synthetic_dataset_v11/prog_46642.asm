; DESCRIPTION: Draws a orange circle centered at (110, 200) with radius 55.
; PLAN: r0=110(x), r1=200(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 200
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
