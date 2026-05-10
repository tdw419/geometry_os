; DESCRIPTION: Places a purple circle of radius 34 at center (290, 49).
; PLAN: r0=290(x), r1=49(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 49
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
