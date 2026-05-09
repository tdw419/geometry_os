; DESCRIPTION: Renders a blue disk with center (22, 170) and radius 21.
; PLAN: r0=22(x), r1=170(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 170
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
