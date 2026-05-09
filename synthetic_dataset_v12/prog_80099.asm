; DESCRIPTION: Creates a orange circular shape at (81, 78) with radius 77.
; PLAN: r0=81(x), r1=78(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 78
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
