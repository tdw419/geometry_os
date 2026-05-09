; DESCRIPTION: Draws a purple line from (206, 206) to (486, 145).
; PLAN: r0=206(x1), r1=206(y1), r2=486(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 206
LDI r2, 486
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
