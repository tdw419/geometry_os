; DESCRIPTION: Renders a white disk with center (129, 104) and radius 60.
; PLAN: r0=129(x), r1=104(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 104
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
