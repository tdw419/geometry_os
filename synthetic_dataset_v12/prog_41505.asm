; DESCRIPTION: Creates a white circular shape at (109, 68) with radius 31.
; PLAN: r0=109(x), r1=68(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 68
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
