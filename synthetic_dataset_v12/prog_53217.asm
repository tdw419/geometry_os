; DESCRIPTION: Renders a black disk with center (347, 137) and radius 18.
; PLAN: r0=347(x), r1=137(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 137
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
