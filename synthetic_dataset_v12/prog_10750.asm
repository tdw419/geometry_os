; DESCRIPTION: Draws a blue line from (447, 136) to (448, 216).
; PLAN: r0=447(x1), r1=136(y1), r2=448(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 136
LDI r2, 448
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
