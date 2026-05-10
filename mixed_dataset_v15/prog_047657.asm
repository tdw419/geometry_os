; DESCRIPTION: Draws a purple line from (491, 1) to (351, 149).
; PLAN: r0=491(x1), r1=1(y1), r2=351(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 1
LDI r2, 351
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
