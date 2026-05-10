; DESCRIPTION: Draws a purple line from (219, 144) to (149, 11).
; PLAN: r0=219(x1), r1=144(y1), r2=149(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 144
LDI r2, 149
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
