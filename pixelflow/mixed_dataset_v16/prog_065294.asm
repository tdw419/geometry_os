; DESCRIPTION: Renders a blue disk with center (261, 83) and radius 31.
; PLAN: r0=261(x), r1=83(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 83
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
