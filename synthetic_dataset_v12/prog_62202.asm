; DESCRIPTION: Renders a white disk with center (390, 135) and radius 31.
; PLAN: r0=390(x), r1=135(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 135
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
