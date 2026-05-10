; DESCRIPTION: Creates a orange circular shape at (399, 75) with radius 54.
; PLAN: r0=399(x), r1=75(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 75
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
