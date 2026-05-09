; DESCRIPTION: Places a green circle of radius 65 at center (110, 80).
; PLAN: r0=110(x), r1=80(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 80
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
