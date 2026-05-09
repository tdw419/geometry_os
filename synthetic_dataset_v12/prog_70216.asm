; DESCRIPTION: Draws a purple line from (233, 147) to (221, 70).
; PLAN: r0=233(x1), r1=147(y1), r2=221(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 147
LDI r2, 221
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
