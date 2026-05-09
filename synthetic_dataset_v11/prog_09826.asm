; DESCRIPTION: Creates a red circular shape at (155, 110) with radius 74.
; PLAN: r0=155(x), r1=110(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 110
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
