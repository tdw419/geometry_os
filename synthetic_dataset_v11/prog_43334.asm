; DESCRIPTION: Creates a white circular shape at (116, 73) with radius 73.
; PLAN: r0=116(x), r1=73(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 73
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
