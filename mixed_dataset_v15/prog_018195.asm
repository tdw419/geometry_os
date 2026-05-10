; DESCRIPTION: Renders a white disk with center (56, 175) and radius 51.
; PLAN: r0=56(x), r1=175(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 175
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
