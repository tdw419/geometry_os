; DESCRIPTION: Draws a purple line from (118, 66) to (24, 131).
; PLAN: r0=118(x1), r1=66(y1), r2=24(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 66
LDI r2, 24
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
