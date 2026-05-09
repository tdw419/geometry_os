; DESCRIPTION: Renders a white disk with center (71, 37) and radius 37.
; PLAN: r0=71(x), r1=37(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 37
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
