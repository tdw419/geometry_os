; DESCRIPTION: Draws a orange circle centered at (459, 172) with radius 10.
; PLAN: r0=459(x), r1=172(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 172
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
