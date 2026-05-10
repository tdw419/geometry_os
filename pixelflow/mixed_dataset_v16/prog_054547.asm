; DESCRIPTION: Renders a white disk with center (334, 70) and radius 20.
; PLAN: r0=334(x), r1=70(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 70
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
