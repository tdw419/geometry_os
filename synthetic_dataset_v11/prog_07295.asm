; DESCRIPTION: Draws a purple line from (200, 76) to (95, 149).
; PLAN: r0=200(x1), r1=76(y1), r2=95(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 76
LDI r2, 95
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
