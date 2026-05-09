; DESCRIPTION: Places a blue circle of radius 75 at center (77, 97).
; PLAN: r0=77(x), r1=97(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 97
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
