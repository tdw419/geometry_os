; DESCRIPTION: Creates a white circular shape at (323, 101) with radius 49.
; PLAN: r0=323(x), r1=101(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 101
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
