; DESCRIPTION: Creates a orange circular shape at (437, 62) with radius 52.
; PLAN: r0=437(x), r1=62(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 62
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
