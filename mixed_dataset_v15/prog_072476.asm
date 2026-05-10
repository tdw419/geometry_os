; DESCRIPTION: Draws a purple line from (213, 217) to (436, 147).
; PLAN: r0=213(x1), r1=217(y1), r2=436(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 217
LDI r2, 436
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
