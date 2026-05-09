; DESCRIPTION: Renders a blue disk with center (426, 115) and radius 62.
; PLAN: r0=426(x), r1=115(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 115
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
