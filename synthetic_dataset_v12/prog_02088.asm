; DESCRIPTION: Draws a purple line from (202, 84) to (250, 88).
; PLAN: r0=202(x1), r1=84(y1), r2=250(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 84
LDI r2, 250
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
