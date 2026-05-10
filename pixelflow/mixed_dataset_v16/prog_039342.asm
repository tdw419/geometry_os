; DESCRIPTION: Draws a orange circle centered at (47, 112) with radius 31.
; PLAN: r0=47(x), r1=112(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 112
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
