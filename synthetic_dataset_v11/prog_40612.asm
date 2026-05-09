; DESCRIPTION: Renders a green disk with center (192, 40) and radius 12.
; PLAN: r0=192(x), r1=40(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 40
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
