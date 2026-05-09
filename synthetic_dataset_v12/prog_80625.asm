; DESCRIPTION: Creates a white circular shape at (259, 62) with radius 51.
; PLAN: r0=259(x), r1=62(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 62
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
