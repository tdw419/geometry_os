; DESCRIPTION: Creates a white circular shape at (453, 72) with radius 31.
; PLAN: r0=453(x), r1=72(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 72
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
