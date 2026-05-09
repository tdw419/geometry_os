; DESCRIPTION: Creates a white circular shape at (60, 169) with radius 37.
; PLAN: r0=60(x), r1=169(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 169
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
