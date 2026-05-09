; DESCRIPTION: Places a purple line segment connecting (162, 16) to (180, 1).
; PLAN: r0=162(x1), r1=16(y1), r2=180(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 16
LDI r2, 180
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
