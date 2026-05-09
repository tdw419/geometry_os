; DESCRIPTION: Creates a orange circular shape at (100, 167) with radius 14.
; PLAN: r0=100(x), r1=167(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 167
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
