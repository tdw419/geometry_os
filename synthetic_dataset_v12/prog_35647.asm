; DESCRIPTION: Renders a green disk with center (194, 192) and radius 63.
; PLAN: r0=194(x), r1=192(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 192
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
