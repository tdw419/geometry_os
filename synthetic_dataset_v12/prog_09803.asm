; DESCRIPTION: Creates a white circular shape at (106, 158) with radius 40.
; PLAN: r0=106(x), r1=158(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 158
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
