; DESCRIPTION: Renders a blue disk with center (192, 87) and radius 25.
; PLAN: r0=192(x), r1=87(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 87
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
