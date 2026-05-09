; DESCRIPTION: Creates a white circular shape at (77, 169) with radius 68.
; PLAN: r0=77(x), r1=169(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 169
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
