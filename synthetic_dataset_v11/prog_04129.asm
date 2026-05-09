; DESCRIPTION: Draws a purple line from (118, 160) to (73, 181).
; PLAN: r0=118(x1), r1=160(y1), r2=73(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 160
LDI r2, 73
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
