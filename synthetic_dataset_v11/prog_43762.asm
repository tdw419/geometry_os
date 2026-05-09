; DESCRIPTION: Draws a purple line from (209, 118) to (100, 54).
; PLAN: r0=209(x1), r1=118(y1), r2=100(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 118
LDI r2, 100
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
