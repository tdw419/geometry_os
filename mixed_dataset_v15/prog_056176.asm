; DESCRIPTION: Creates a white circular shape at (471, 83) with radius 29.
; PLAN: r0=471(x), r1=83(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 83
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
