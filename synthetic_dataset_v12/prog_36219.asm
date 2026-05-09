; DESCRIPTION: Creates a orange circular shape at (115, 77) with radius 18.
; PLAN: r0=115(x), r1=77(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 77
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
