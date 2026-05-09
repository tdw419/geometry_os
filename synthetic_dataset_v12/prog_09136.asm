; DESCRIPTION: Creates a orange circular shape at (334, 132) with radius 77.
; PLAN: r0=334(x), r1=132(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 132
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
