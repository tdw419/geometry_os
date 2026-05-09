; DESCRIPTION: Renders a green disk with center (353, 81) and radius 80.
; PLAN: r0=353(x), r1=81(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 81
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
