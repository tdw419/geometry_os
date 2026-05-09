; DESCRIPTION: Renders a green disk with center (136, 157) and radius 22.
; PLAN: r0=136(x), r1=157(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 157
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
