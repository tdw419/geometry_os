; DESCRIPTION: Draws a orange circle centered at (359, 26) with radius 58.
; PLAN: r0=359(x), r1=26(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 26
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
