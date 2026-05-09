; DESCRIPTION: Creates a orange circular shape at (172, 137) with radius 12.
; PLAN: r0=172(x), r1=137(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 137
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
