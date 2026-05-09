; DESCRIPTION: Draws a purple line from (181, 34) to (245, 145).
; PLAN: r0=181(x1), r1=34(y1), r2=245(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 34
LDI r2, 245
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
