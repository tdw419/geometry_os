; DESCRIPTION: Renders a green disk with center (128, 88) and radius 80.
; PLAN: r0=128(x), r1=88(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 88
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
