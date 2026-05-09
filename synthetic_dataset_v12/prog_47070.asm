; DESCRIPTION: Renders a white disk with center (244, 169) and radius 58.
; PLAN: r0=244(x), r1=169(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 169
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
