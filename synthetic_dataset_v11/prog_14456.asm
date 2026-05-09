; DESCRIPTION: Places a black circle of radius 76 at center (77, 78).
; PLAN: r0=77(x), r1=78(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 78
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
