; DESCRIPTION: Draws a purple line from (344, 40) to (58, 103).
; PLAN: r0=344(x1), r1=40(y1), r2=58(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 40
LDI r2, 58
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
