; DESCRIPTION: Places a blue line segment connecting (490, 57) to (432, 82).
; PLAN: r0=490(x1), r1=57(y1), r2=432(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 57
LDI r2, 432
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
