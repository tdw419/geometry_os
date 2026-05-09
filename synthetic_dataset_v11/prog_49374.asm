; DESCRIPTION: Draws a purple line from (38, 254) to (204, 30).
; PLAN: r0=38(x1), r1=254(y1), r2=204(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 254
LDI r2, 204
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
