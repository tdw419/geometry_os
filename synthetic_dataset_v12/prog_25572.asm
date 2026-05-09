; DESCRIPTION: Creates a black circular shape at (66, 77) with radius 48.
; PLAN: r0=66(x), r1=77(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 77
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
