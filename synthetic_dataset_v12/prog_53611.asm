; DESCRIPTION: Draws a orange circle centered at (253, 61) with radius 56.
; PLAN: r0=253(x), r1=61(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 61
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
