; DESCRIPTION: Places a green disk with center (136, 69) and radius 12.
; PLAN: r0=136(x), r1=69(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 69
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
