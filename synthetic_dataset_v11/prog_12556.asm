; DESCRIPTION: Creates a white circular shape at (57, 73) with radius 28.
; PLAN: r0=57(x), r1=73(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 73
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
