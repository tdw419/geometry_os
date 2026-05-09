; DESCRIPTION: Creates a orange circular shape at (70, 105) with radius 10.
; PLAN: r0=70(x), r1=105(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 105
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
