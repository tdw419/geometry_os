; DESCRIPTION: Draws a purple line from (133, 26) to (339, 197).
; PLAN: r0=133(x1), r1=26(y1), r2=339(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 26
LDI r2, 339
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
