; DESCRIPTION: Draws a yellow line from (501, 6) to (200, 133).
; PLAN: r0=501(x1), r1=6(y1), r2=200(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 6
LDI r2, 200
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
