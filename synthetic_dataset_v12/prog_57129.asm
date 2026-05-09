; DESCRIPTION: Renders a white disk with center (206, 136) and radius 70.
; PLAN: r0=206(x), r1=136(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 136
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
