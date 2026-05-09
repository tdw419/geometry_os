; DESCRIPTION: Creates a white circular shape at (244, 158) with radius 27.
; PLAN: r0=244(x), r1=158(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 158
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
