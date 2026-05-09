; DESCRIPTION: Places a blue line segment connecting (181, 112) to (118, 121).
; PLAN: r0=181(x1), r1=112(y1), r2=118(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 112
LDI r2, 118
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
