; DESCRIPTION: Draws a purple line from (250, 4) to (44, 80).
; PLAN: r0=250(x1), r1=4(y1), r2=44(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 4
LDI r2, 44
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
