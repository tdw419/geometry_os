; DESCRIPTION: Places a purple circle of radius 17 at center (158, 54).
; PLAN: r0=158(x), r1=54(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 54
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
