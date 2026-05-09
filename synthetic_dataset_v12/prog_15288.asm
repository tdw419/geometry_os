; DESCRIPTION: Creates a black circular shape at (313, 77) with radius 64.
; PLAN: r0=313(x), r1=77(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 77
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
