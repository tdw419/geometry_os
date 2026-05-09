; DESCRIPTION: Draws a purple line from (170, 58) to (164, 145).
; PLAN: r0=170(x1), r1=58(y1), r2=164(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 58
LDI r2, 164
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
