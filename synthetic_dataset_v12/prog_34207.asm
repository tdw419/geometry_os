; DESCRIPTION: Draws a blue line from (130, 169) to (448, 180).
; PLAN: r0=130(x1), r1=169(y1), r2=448(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 169
LDI r2, 448
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
