; DESCRIPTION: Draws a orange circle centered at (292, 105) with radius 52.
; PLAN: r0=292(x), r1=105(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 105
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
