; DESCRIPTION: Creates a orange circular shape at (89, 54) with radius 14.
; PLAN: r0=89(x), r1=54(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 54
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
