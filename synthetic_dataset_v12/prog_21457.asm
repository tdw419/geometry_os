; DESCRIPTION: Creates a black circular shape at (389, 80) with radius 76.
; PLAN: r0=389(x), r1=80(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 80
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
