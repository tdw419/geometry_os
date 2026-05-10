; DESCRIPTION: Draws a purple line from (404, 145) to (390, 237).
; PLAN: r0=404(x1), r1=145(y1), r2=390(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 145
LDI r2, 390
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
