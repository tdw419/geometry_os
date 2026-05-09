; DESCRIPTION: Creates a white circular shape at (140, 121) with radius 73.
; PLAN: r0=140(x), r1=121(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 121
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
