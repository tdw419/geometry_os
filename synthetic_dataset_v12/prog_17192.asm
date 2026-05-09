; DESCRIPTION: Draws a purple line from (123, 206) to (459, 17).
; PLAN: r0=123(x1), r1=206(y1), r2=459(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 206
LDI r2, 459
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
