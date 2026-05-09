; DESCRIPTION: Renders a green disk with center (201, 102) and radius 65.
; PLAN: r0=201(x), r1=102(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 102
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
