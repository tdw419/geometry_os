; DESCRIPTION: Draws a orange circle centered at (304, 10) with radius 30.
; PLAN: r0=304(x), r1=10(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 10
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
