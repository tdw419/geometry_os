; DESCRIPTION: Creates a white circular shape at (11, 73) with radius 11.
; PLAN: r0=11(x), r1=73(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 11
LDI r1, 73
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
