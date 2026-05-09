; DESCRIPTION: Creates a orange circular shape at (179, 117) with radius 77.
; PLAN: r0=179(x), r1=117(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 117
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
