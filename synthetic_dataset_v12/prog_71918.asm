; DESCRIPTION: Places a green circle of radius 74 at center (110, 122).
; PLAN: r0=110(x), r1=122(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 122
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
