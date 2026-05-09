; DESCRIPTION: Places a green circle of radius 49 at center (62, 188).
; PLAN: r0=62(x), r1=188(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 188
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
