; DESCRIPTION: Creates a white circular shape at (55, 199) with radius 34.
; PLAN: r0=55(x), r1=199(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 199
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
