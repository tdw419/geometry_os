; DESCRIPTION: Draws a purple line from (1, 115) to (62, 196).
; PLAN: r0=1(x1), r1=115(y1), r2=62(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 115
LDI r2, 62
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
