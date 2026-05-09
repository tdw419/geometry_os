; DESCRIPTION: Draws a blue line from (344, 117) to (328, 245).
; PLAN: r0=344(x1), r1=117(y1), r2=328(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 117
LDI r2, 328
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
