; DESCRIPTION: Places a green disk with center (55, 14) and radius 37.
; PLAN: r0=55(x), r1=14(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 14
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
