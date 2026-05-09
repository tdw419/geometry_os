; DESCRIPTION: Creates a white circular shape at (341, 183) with radius 36.
; PLAN: r0=341(x), r1=183(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 183
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
