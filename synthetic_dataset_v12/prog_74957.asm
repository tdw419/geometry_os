; DESCRIPTION: Creates a orange circular shape at (169, 57) with radius 23.
; PLAN: r0=169(x), r1=57(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 57
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
