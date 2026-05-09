; DESCRIPTION: Places a blue line segment connecting (93, 17) to (162, 206).
; PLAN: r0=93(x1), r1=17(y1), r2=162(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 17
LDI r2, 162
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
