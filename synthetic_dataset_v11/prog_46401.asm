; DESCRIPTION: Places a purple circle of radius 66 at center (117, 102).
; PLAN: r0=117(x), r1=102(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 102
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
