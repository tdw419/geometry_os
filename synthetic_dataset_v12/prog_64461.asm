; DESCRIPTION: Draws a purple line from (189, 97) to (181, 104).
; PLAN: r0=189(x1), r1=97(y1), r2=181(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 97
LDI r2, 181
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
