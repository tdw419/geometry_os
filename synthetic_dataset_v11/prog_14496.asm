; DESCRIPTION: Creates a green circular shape at (189, 89) with radius 61.
; PLAN: r0=189(x), r1=89(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 89
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
