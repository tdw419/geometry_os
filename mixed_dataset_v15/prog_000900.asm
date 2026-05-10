; DESCRIPTION: Places a purple line segment connecting (490, 162) to (180, 131).
; PLAN: r0=490(x1), r1=162(y1), r2=180(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 162
LDI r2, 180
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
