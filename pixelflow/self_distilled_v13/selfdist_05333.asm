; DESCRIPTION: Draws a orange circle centered at (101, 156) with radius 61.
; PLAN: r0=101(x), r1=156(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 156
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
