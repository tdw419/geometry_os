; DESCRIPTION: Renders a white disk with center (400, 169) and radius 14.
; PLAN: r0=400(x), r1=169(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 169
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
