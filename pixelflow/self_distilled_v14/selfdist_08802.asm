; DESCRIPTION: Places a green disk with center (15, 3) and radius 80.
; PLAN: r0=15(x), r1=3(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 15
LDI r1, 3
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
