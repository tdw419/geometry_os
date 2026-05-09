; DESCRIPTION: Renders a blue disk with center (144, 184) and radius 34.
; PLAN: r0=144(x), r1=184(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 184
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
