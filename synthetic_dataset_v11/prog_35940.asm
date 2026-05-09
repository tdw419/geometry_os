; DESCRIPTION: Renders a purple line between points (84, 133) and (236, 105).
; PLAN: r0=84(x1), r1=133(y1), r2=236(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 133
LDI r2, 236
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
