; DESCRIPTION: Renders a white disk with center (414, 122) and radius 51.
; PLAN: r0=414(x), r1=122(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 122
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
