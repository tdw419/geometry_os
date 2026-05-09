; DESCRIPTION: Creates a white circular shape at (71, 61) with radius 25.
; PLAN: r0=71(x), r1=61(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 61
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
