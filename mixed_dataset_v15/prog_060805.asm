; DESCRIPTION: Places a purple circle of radius 75 at center (220, 170).
; PLAN: r0=220(x), r1=170(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 170
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
