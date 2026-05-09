; DESCRIPTION: Creates a black circular shape at (361, 97) with radius 80.
; PLAN: r0=361(x), r1=97(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 97
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
