; DESCRIPTION: Creates a white circular shape at (36, 118) with radius 22.
; PLAN: r0=36(x), r1=118(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 118
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
