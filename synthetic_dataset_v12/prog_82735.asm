; DESCRIPTION: Places a blue line segment connecting (132, 106) to (22, 118).
; PLAN: r0=132(x1), r1=106(y1), r2=22(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 106
LDI r2, 22
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
