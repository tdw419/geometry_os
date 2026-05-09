; DESCRIPTION: Places a purple circle of radius 72 at center (79, 105).
; PLAN: r0=79(x), r1=105(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 105
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
