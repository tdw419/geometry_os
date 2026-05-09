; DESCRIPTION: Places a purple line segment connecting (393, 250) to (448, 198).
; PLAN: r0=393(x1), r1=250(y1), r2=448(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 250
LDI r2, 448
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
