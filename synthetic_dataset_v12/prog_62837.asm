; DESCRIPTION: Creates a black circular shape at (158, 83) with radius 43.
; PLAN: r0=158(x), r1=83(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 83
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
