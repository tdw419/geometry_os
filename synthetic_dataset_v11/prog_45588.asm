; DESCRIPTION: Renders a white disk with center (165, 78) and radius 66.
; PLAN: r0=165(x), r1=78(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 78
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
