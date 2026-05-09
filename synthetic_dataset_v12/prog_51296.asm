; DESCRIPTION: Draws a purple line from (489, 65) to (277, 24).
; PLAN: r0=489(x1), r1=65(y1), r2=277(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 65
LDI r2, 277
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
