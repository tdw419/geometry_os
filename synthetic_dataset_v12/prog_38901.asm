; DESCRIPTION: Draws a purple line from (484, 115) to (103, 232).
; PLAN: r0=484(x1), r1=115(y1), r2=103(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 115
LDI r2, 103
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
