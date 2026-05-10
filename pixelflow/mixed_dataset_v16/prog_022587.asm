; DESCRIPTION: Places a green disk with center (8, 15) and radius 75.
; PLAN: r0=8(x), r1=15(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 8
LDI r1, 15
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
