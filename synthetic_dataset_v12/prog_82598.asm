; DESCRIPTION: Creates a orange circular shape at (204, 95) with radius 26.
; PLAN: r0=204(x), r1=95(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 95
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
