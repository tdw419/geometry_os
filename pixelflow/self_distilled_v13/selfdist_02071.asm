; DESCRIPTION: Draws a purple line from (389, 133) to (243, 178).
; PLAN: r0=389(x1), r1=133(y1), r2=243(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 133
LDI r2, 243
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
