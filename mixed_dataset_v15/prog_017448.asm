; DESCRIPTION: Renders a green disk with center (133, 110) and radius 49.
; PLAN: r0=133(x), r1=110(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 110
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
