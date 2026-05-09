; DESCRIPTION: Renders a blue disk with center (469, 188) and radius 20.
; PLAN: r0=469(x), r1=188(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 188
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
