; DESCRIPTION: Renders a black disk with center (325, 98) and radius 51.
; PLAN: r0=325(x), r1=98(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 98
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
