; DESCRIPTION: Renders a green disk with center (155, 40) and radius 16.
; PLAN: r0=155(x), r1=40(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 40
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
