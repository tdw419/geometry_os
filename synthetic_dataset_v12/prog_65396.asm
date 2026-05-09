; DESCRIPTION: Draws a purple line from (308, 38) to (316, 198).
; PLAN: r0=308(x1), r1=38(y1), r2=316(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 38
LDI r2, 316
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
