; DESCRIPTION: Renders a white disk with center (366, 112) and radius 76.
; PLAN: r0=366(x), r1=112(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 112
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
