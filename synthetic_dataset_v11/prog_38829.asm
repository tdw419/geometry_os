; DESCRIPTION: Draws a purple line from (133, 254) to (154, 248).
; PLAN: r0=133(x1), r1=254(y1), r2=154(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 254
LDI r2, 154
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
