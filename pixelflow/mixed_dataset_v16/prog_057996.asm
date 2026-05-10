; DESCRIPTION: Draws a orange circle centered at (253, 162) with radius 47.
; PLAN: r0=253(x), r1=162(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 162
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
