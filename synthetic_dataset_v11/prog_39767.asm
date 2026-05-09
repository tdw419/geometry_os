; DESCRIPTION: Renders a white disk with center (115, 104) and radius 24.
; PLAN: r0=115(x), r1=104(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 104
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
