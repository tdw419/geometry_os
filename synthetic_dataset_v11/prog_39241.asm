; DESCRIPTION: Renders a green disk with center (136, 171) and radius 64.
; PLAN: r0=136(x), r1=171(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 171
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
