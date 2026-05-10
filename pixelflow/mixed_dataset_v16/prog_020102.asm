; DESCRIPTION: Draws a purple line from (306, 29) to (1, 19).
; PLAN: r0=306(x1), r1=29(y1), r2=1(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 29
LDI r2, 1
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
