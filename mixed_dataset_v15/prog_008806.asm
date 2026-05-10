; DESCRIPTION: Renders a green disk with center (288, 192) and radius 39.
; PLAN: r0=288(x), r1=192(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 192
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
