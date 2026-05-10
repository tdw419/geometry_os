; DESCRIPTION: Draws a orange circle centered at (182, 49) with radius 31.
; PLAN: r0=182(x), r1=49(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 49
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
