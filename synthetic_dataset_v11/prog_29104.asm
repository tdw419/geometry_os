; DESCRIPTION: Draws a orange circle centered at (112, 76) with radius 70.
; PLAN: r0=112(x), r1=76(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 76
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
