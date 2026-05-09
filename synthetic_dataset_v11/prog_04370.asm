; DESCRIPTION: Renders a white disk with center (83, 114) and radius 71.
; PLAN: r0=83(x), r1=114(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 114
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
