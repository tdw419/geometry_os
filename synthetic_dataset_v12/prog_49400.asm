; DESCRIPTION: Draws a purple line from (323, 251) to (344, 216).
; PLAN: r0=323(x1), r1=251(y1), r2=344(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 251
LDI r2, 344
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
