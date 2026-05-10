; DESCRIPTION: Creates a white circular shape at (140, 123) with radius 57.
; PLAN: r0=140(x), r1=123(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 123
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
