; DESCRIPTION: Renders a white disk with center (177, 80) and radius 76.
; PLAN: r0=177(x), r1=80(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 80
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
