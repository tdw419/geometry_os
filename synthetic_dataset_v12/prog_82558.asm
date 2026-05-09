; DESCRIPTION: Draws a purple line from (407, 181) to (471, 247).
; PLAN: r0=407(x1), r1=181(y1), r2=471(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 181
LDI r2, 471
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
