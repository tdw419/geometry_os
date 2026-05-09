; DESCRIPTION: Draws a orange circle centered at (170, 106) with radius 33.
; PLAN: r0=170(x), r1=106(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 106
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
