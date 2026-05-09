; DESCRIPTION: Creates a orange circular shape at (137, 115) with radius 73.
; PLAN: r0=137(x), r1=115(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 115
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
