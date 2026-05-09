; DESCRIPTION: Creates a black circular shape at (143, 196) with radius 58.
; PLAN: r0=143(x), r1=196(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 196
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
