; DESCRIPTION: Renders a black disk with center (458, 94) and radius 11.
; PLAN: r0=458(x), r1=94(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 94
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
