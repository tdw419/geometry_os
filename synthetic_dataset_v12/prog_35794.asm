; DESCRIPTION: Draws a purple line from (496, 176) to (389, 66).
; PLAN: r0=496(x1), r1=176(y1), r2=389(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 176
LDI r2, 389
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
