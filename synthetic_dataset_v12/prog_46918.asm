; DESCRIPTION: Creates a green circular shape at (194, 143) with radius 76.
; PLAN: r0=194(x), r1=143(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 143
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
