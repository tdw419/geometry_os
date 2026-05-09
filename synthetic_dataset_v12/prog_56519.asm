; DESCRIPTION: Renders a white disk with center (165, 136) and radius 59.
; PLAN: r0=165(x), r1=136(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 136
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
