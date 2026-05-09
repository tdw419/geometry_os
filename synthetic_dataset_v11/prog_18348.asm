; DESCRIPTION: Draws a blue line from (165, 133) to (200, 90).
; PLAN: r0=165(x1), r1=133(y1), r2=200(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 133
LDI r2, 200
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
