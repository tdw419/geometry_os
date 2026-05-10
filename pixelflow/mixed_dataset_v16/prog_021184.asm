; DESCRIPTION: Draws a purple line from (98, 46) to (306, 9).
; PLAN: r0=98(x1), r1=46(y1), r2=306(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 46
LDI r2, 306
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
