; DESCRIPTION: Places a green circle of radius 66 at center (110, 78).
; PLAN: r0=110(x), r1=78(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 78
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
