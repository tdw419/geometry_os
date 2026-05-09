; DESCRIPTION: Creates a black circular shape at (437, 56) with radius 18.
; PLAN: r0=437(x), r1=56(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 56
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
