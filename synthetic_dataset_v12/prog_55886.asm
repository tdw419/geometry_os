; DESCRIPTION: Draws a orange circle centered at (300, 122) with radius 43.
; PLAN: r0=300(x), r1=122(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 122
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
