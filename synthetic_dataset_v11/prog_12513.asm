; DESCRIPTION: Renders a green disk with center (192, 43) and radius 23.
; PLAN: r0=192(x), r1=43(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 43
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
