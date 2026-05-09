; DESCRIPTION: Places a purple circle of radius 21 at center (430, 233).
; PLAN: r0=430(x), r1=233(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 233
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
