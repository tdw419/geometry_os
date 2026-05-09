; DESCRIPTION: Draws a purple line from (176, 119) to (469, 85).
; PLAN: r0=176(x1), r1=119(y1), r2=469(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 119
LDI r2, 469
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
