; DESCRIPTION: Renders a yellow line between points (84, 192) and (484, 79).
; PLAN: r0=84(x1), r1=192(y1), r2=484(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 192
LDI r2, 484
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
