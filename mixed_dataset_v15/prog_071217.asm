; DESCRIPTION: Draws a purple line from (145, 21) to (163, 31).
; PLAN: r0=145(x1), r1=21(y1), r2=163(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 21
LDI r2, 163
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
