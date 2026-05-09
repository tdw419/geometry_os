; DESCRIPTION: Draws a purple line from (137, 254) to (200, 227).
; PLAN: r0=137(x1), r1=254(y1), r2=200(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 254
LDI r2, 200
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
