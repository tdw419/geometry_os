; DESCRIPTION: Creates a orange circular shape at (23, 158) with radius 14.
; PLAN: r0=23(x), r1=158(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 158
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
