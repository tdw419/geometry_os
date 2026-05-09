; DESCRIPTION: Renders a white disk with center (148, 118) and radius 76.
; PLAN: r0=148(x), r1=118(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 118
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
