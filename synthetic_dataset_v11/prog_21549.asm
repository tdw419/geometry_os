; DESCRIPTION: Renders a black disk with center (129, 124) and radius 80.
; PLAN: r0=129(x), r1=124(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 124
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
