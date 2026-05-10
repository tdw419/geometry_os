; DESCRIPTION: Draws a blue line from (118, 88) to (84, 101).
; PLAN: r0=118(x1), r1=88(y1), r2=84(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 88
LDI r2, 84
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
