; DESCRIPTION: Draws a purple line from (344, 130) to (306, 181).
; PLAN: r0=344(x1), r1=130(y1), r2=306(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 130
LDI r2, 306
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
