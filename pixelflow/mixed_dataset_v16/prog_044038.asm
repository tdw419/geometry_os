; DESCRIPTION: Renders a white disk with center (448, 199) and radius 19.
; PLAN: r0=448(x), r1=199(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 199
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
