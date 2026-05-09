; DESCRIPTION: Creates a white circular shape at (112, 169) with radius 80.
; PLAN: r0=112(x), r1=169(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 169
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
