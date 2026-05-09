; DESCRIPTION: Draws a purple line from (206, 77) to (146, 147).
; PLAN: r0=206(x1), r1=77(y1), r2=146(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 77
LDI r2, 146
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
