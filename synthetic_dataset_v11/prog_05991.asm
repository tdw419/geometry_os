; DESCRIPTION: Creates a white circular shape at (129, 128) with radius 77.
; PLAN: r0=129(x), r1=128(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 128
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
