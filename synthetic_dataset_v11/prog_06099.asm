; DESCRIPTION: Creates a black circular shape at (158, 160) with radius 77.
; PLAN: r0=158(x), r1=160(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 160
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
