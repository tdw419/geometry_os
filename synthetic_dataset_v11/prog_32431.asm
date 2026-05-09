; DESCRIPTION: Creates a white circular shape at (112, 100) with radius 71.
; PLAN: r0=112(x), r1=100(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 100
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
