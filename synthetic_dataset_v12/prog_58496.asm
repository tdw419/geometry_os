; DESCRIPTION: Creates a orange circular shape at (99, 184) with radius 43.
; PLAN: r0=99(x), r1=184(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 184
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
