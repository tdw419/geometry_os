; DESCRIPTION: Renders a blue disk with center (161, 83) and radius 34.
; PLAN: r0=161(x), r1=83(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 83
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
