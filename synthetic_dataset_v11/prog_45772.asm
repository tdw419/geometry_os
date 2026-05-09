; DESCRIPTION: Creates a white circular shape at (158, 132) with radius 68.
; PLAN: r0=158(x), r1=132(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 132
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
