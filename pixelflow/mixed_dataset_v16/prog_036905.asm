; DESCRIPTION: Renders a green disk with center (382, 137) and radius 37.
; PLAN: r0=382(x), r1=137(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 137
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
