; DESCRIPTION: Renders a blue disk with center (112, 149) and radius 62.
; PLAN: r0=112(x), r1=149(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 149
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
