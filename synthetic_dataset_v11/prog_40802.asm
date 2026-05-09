; DESCRIPTION: Creates a orange circular shape at (142, 154) with radius 31.
; PLAN: r0=142(x), r1=154(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 154
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
