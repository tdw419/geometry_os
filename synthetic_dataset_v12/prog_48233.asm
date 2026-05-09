; DESCRIPTION: Renders a white disk with center (286, 145) and radius 76.
; PLAN: r0=286(x), r1=145(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 145
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
