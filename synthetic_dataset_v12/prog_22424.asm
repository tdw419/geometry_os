; DESCRIPTION: Places a purple circle of radius 70 at center (427, 86).
; PLAN: r0=427(x), r1=86(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 86
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
