; DESCRIPTION: Creates a orange circular shape at (244, 158) with radius 71.
; PLAN: r0=244(x), r1=158(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 158
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
