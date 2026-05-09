; DESCRIPTION: Draws a blue line from (243, 160) to (484, 169).
; PLAN: r0=243(x1), r1=160(y1), r2=484(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 160
LDI r2, 484
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
