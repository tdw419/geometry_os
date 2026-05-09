; DESCRIPTION: Creates a orange circular shape at (123, 106) with radius 57.
; PLAN: r0=123(x), r1=106(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 106
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
