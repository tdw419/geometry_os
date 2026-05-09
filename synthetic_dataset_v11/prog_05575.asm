; DESCRIPTION: Draws a orange circle centered at (153, 83) with radius 61.
; PLAN: r0=153(x), r1=83(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 83
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
