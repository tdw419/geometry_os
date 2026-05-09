; DESCRIPTION: Creates a orange circular shape at (158, 175) with radius 74.
; PLAN: r0=158(x), r1=175(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 175
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
