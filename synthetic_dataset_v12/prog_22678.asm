; DESCRIPTION: Draws a orange circle centered at (80, 106) with radius 15.
; PLAN: r0=80(x), r1=106(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 106
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
