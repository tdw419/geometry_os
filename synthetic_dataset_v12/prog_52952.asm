; DESCRIPTION: Renders a green disk with center (333, 158) and radius 17.
; PLAN: r0=333(x), r1=158(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 158
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
