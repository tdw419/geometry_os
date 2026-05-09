; DESCRIPTION: Draws a purple line from (97, 12) to (400, 105).
; PLAN: r0=97(x1), r1=12(y1), r2=400(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 12
LDI r2, 400
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
