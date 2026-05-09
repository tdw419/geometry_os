; DESCRIPTION: Places a blue circle of radius 66 at center (364, 97).
; PLAN: r0=364(x), r1=97(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 97
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
