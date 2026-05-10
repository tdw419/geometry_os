; DESCRIPTION: Places a purple circle of radius 47 at center (406, 86).
; PLAN: r0=406(x), r1=86(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 86
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
