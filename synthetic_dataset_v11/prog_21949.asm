; DESCRIPTION: Renders a white disk with center (51, 147) and radius 11.
; PLAN: r0=51(x), r1=147(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 147
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
