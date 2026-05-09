; DESCRIPTION: Renders a white disk with center (303, 134) and radius 76.
; PLAN: r0=303(x), r1=134(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 134
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
