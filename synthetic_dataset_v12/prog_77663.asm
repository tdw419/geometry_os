; DESCRIPTION: Draws a orange circle centered at (107, 153) with radius 75.
; PLAN: r0=107(x), r1=153(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 153
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
