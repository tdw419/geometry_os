; DESCRIPTION: Draws a purple line from (36, 3) to (252, 97).
; PLAN: r0=36(x1), r1=3(y1), r2=252(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 3
LDI r2, 252
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
