; DESCRIPTION: Draws a orange circle centered at (100, 110) with radius 52.
; PLAN: r0=100(x), r1=110(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 110
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
