; DESCRIPTION: Draws a orange circle centered at (361, 137) with radius 22.
; PLAN: r0=361(x), r1=137(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 137
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
