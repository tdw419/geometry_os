; DESCRIPTION: Creates a white circular shape at (95, 123) with radius 78.
; PLAN: r0=95(x), r1=123(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 123
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
