; DESCRIPTION: Renders a white disk with center (151, 88) and radius 79.
; PLAN: r0=151(x), r1=88(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 88
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
