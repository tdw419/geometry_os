; DESCRIPTION: Renders a green disk with center (136, 189) and radius 49.
; PLAN: r0=136(x), r1=189(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 189
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
