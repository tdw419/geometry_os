; DESCRIPTION: Creates a orange circular shape at (227, 83) with radius 59.
; PLAN: r0=227(x), r1=83(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 83
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
