; DESCRIPTION: Creates a black circular shape at (409, 143) with radius 72.
; PLAN: r0=409(x), r1=143(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 143
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
