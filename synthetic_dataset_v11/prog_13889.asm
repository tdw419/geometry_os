; DESCRIPTION: Renders a white disk with center (142, 218) and radius 38.
; PLAN: r0=142(x), r1=218(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 218
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
