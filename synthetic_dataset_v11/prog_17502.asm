; DESCRIPTION: Places a purple circle of radius 74 at center (91, 86).
; PLAN: r0=91(x), r1=86(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 86
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
