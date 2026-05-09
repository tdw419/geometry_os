; DESCRIPTION: Draws a orange circle centered at (148, 104) with radius 25.
; PLAN: r0=148(x), r1=104(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 104
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
