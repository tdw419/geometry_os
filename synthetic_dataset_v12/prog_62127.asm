; DESCRIPTION: Renders a green disk with center (192, 108) and radius 27.
; PLAN: r0=192(x), r1=108(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 108
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
