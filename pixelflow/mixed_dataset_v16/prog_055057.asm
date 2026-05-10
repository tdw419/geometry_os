; DESCRIPTION: Draws a purple line from (306, 74) to (389, 56).
; PLAN: r0=306(x1), r1=74(y1), r2=389(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 74
LDI r2, 389
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
