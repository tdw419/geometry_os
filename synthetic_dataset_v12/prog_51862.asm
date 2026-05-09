; DESCRIPTION: Creates a orange circular shape at (56, 175) with radius 49.
; PLAN: r0=56(x), r1=175(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 175
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
