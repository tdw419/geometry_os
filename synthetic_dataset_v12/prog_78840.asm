; DESCRIPTION: Creates a white circular shape at (192, 89) with radius 49.
; PLAN: r0=192(x), r1=89(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 89
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
