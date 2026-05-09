; DESCRIPTION: Renders a green disk with center (417, 86) and radius 10.
; PLAN: r0=417(x), r1=86(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 86
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
