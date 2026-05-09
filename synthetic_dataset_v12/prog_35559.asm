; DESCRIPTION: Renders a white disk with center (251, 11) and radius 11.
; PLAN: r0=251(x), r1=11(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 11
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
