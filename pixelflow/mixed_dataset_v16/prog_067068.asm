; DESCRIPTION: Creates a orange circular shape at (101, 87) with radius 38.
; PLAN: r0=101(x), r1=87(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 87
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
