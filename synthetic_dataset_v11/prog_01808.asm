; DESCRIPTION: Renders a green disk with center (139, 112) and radius 37.
; PLAN: r0=139(x), r1=112(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 112
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
