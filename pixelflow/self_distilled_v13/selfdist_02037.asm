; DESCRIPTION: Places a green disk with center (29, 24) and radius 20.
; PLAN: r0=29(x), r1=24(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 24
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
