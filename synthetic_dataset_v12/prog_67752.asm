; DESCRIPTION: Draws a purple line from (78, 192) to (89, 56).
; PLAN: r0=78(x1), r1=192(y1), r2=89(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 192
LDI r2, 89
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
