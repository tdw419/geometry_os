; DESCRIPTION: Renders a green disk with center (177, 192) and radius 38.
; PLAN: r0=177(x), r1=192(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 192
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
