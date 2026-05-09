; DESCRIPTION: Renders a green disk with center (222, 144) and radius 36.
; PLAN: r0=222(x), r1=144(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 144
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
