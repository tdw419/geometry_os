; DESCRIPTION: Places a purple line segment connecting (311, 220) to (496, 157).
; PLAN: r0=311(x1), r1=220(y1), r2=496(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 220
LDI r2, 496
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
