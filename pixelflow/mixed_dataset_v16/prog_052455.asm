; DESCRIPTION: Renders a white disk with center (142, 149) and radius 78.
; PLAN: r0=142(x), r1=149(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 149
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
