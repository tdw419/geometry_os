; DESCRIPTION: Draws a purple line from (251, 226) to (344, 153).
; PLAN: r0=251(x1), r1=226(y1), r2=344(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 226
LDI r2, 344
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
