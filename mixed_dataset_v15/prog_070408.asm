; DESCRIPTION: Draws a purple line from (61, 189) to (483, 185).
; PLAN: r0=61(x1), r1=189(y1), r2=483(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 189
LDI r2, 483
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
