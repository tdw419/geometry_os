; DESCRIPTION: Places a green disk with center (136, 136) and radius 74.
; PLAN: r0=136(x), r1=136(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 136
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
