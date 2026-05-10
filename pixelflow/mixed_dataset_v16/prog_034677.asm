; DESCRIPTION: Draws a purple line from (221, 97) to (349, 133).
; PLAN: r0=221(x1), r1=97(y1), r2=349(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 97
LDI r2, 349
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
