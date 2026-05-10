; DESCRIPTION: Draws a purple line from (448, 244) to (219, 119).
; PLAN: r0=448(x1), r1=244(y1), r2=219(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 244
LDI r2, 219
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
