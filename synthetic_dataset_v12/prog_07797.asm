; DESCRIPTION: Renders a green disk with center (155, 148) and radius 13.
; PLAN: r0=155(x), r1=148(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 148
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
