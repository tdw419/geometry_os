; DESCRIPTION: Places a blue line segment connecting (162, 74) to (8, 97).
; PLAN: r0=162(x1), r1=74(y1), r2=8(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 74
LDI r2, 8
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
