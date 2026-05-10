; DESCRIPTION: Creates a white circular shape at (158, 90) with radius 14.
; PLAN: r0=158(x), r1=90(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 90
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
