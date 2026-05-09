; DESCRIPTION: Draws a purple line from (61, 155) to (146, 145).
; PLAN: r0=61(x1), r1=155(y1), r2=146(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 155
LDI r2, 146
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
