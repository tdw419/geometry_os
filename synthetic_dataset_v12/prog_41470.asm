; DESCRIPTION: Draws a blue line from (56, 181) to (118, 49).
; PLAN: r0=56(x1), r1=181(y1), r2=118(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 181
LDI r2, 118
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
