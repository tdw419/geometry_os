; DESCRIPTION: Draws a purple line from (17, 133) to (56, 221).
; PLAN: r0=17(x1), r1=133(y1), r2=56(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 133
LDI r2, 56
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
