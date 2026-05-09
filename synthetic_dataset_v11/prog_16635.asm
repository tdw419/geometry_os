; DESCRIPTION: Renders a black disk with center (77, 53) and radius 37.
; PLAN: r0=77(x), r1=53(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 53
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
