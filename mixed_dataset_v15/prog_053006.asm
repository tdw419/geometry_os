; DESCRIPTION: Renders a white disk with center (347, 142) and radius 73.
; PLAN: r0=347(x), r1=142(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 142
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
