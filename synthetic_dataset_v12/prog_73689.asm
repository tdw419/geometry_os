; DESCRIPTION: Places a blue line segment connecting (179, 162) to (34, 175).
; PLAN: r0=179(x1), r1=162(y1), r2=34(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 162
LDI r2, 34
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
