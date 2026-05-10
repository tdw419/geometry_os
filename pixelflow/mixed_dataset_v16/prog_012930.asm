; DESCRIPTION: Draws a purple line from (339, 4) to (344, 9).
; PLAN: r0=339(x1), r1=4(y1), r2=344(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 4
LDI r2, 344
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
