; DESCRIPTION: Creates a orange circular shape at (74, 87) with radius 17.
; PLAN: r0=74(x), r1=87(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 87
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
