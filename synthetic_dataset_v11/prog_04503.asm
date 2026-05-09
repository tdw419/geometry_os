; DESCRIPTION: Renders a blue disk with center (121, 66) and radius 62.
; PLAN: r0=121(x), r1=66(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 66
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
