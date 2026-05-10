; DESCRIPTION: Renders a green disk with center (256, 119) and radius 60.
; PLAN: r0=256(x), r1=119(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 119
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
