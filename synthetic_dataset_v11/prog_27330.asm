; DESCRIPTION: Creates a orange circular shape at (212, 137) with radius 31.
; PLAN: r0=212(x), r1=137(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 137
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
