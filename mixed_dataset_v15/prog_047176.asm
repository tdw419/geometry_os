; DESCRIPTION: Draws a orange circle centered at (359, 193) with radius 26.
; PLAN: r0=359(x), r1=193(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 193
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
