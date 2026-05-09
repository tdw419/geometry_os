; DESCRIPTION: Creates a orange circular shape at (115, 116) with radius 34.
; PLAN: r0=115(x), r1=116(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 116
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
