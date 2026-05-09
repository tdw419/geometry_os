; DESCRIPTION: Draws a purple line from (400, 77) to (279, 185).
; PLAN: r0=400(x1), r1=77(y1), r2=279(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 77
LDI r2, 279
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
