; DESCRIPTION: Renders a white disk with center (133, 109) and radius 78.
; PLAN: r0=133(x), r1=109(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 109
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
