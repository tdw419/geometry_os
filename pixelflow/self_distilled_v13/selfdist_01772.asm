; DESCRIPTION: Places a green disk with center (57, 83) and radius 22.
; PLAN: r0=57(x), r1=83(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 83
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
