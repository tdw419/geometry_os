; DESCRIPTION: Places a purple circle of radius 79 at center (89, 132).
; PLAN: r0=89(x), r1=132(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 132
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
