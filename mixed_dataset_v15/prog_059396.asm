; DESCRIPTION: Draws a purple line from (90, 15) to (44, 181).
; PLAN: r0=90(x1), r1=15(y1), r2=44(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 15
LDI r2, 44
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
