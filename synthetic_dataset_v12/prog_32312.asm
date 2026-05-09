; DESCRIPTION: Places a purple line segment connecting (11, 13) to (496, 131).
; PLAN: r0=11(x1), r1=13(y1), r2=496(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 13
LDI r2, 496
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
