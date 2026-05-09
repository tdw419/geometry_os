; DESCRIPTION: Places a purple circle of radius 75 at center (86, 129).
; PLAN: r0=86(x), r1=129(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 129
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
