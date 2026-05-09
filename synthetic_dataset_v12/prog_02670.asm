; DESCRIPTION: Renders a white disk with center (423, 191) and radius 51.
; PLAN: r0=423(x), r1=191(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 191
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
