; DESCRIPTION: Draws a orange circle centered at (134, 104) with radius 38.
; PLAN: r0=134(x), r1=104(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 104
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
