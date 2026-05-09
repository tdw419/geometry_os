; DESCRIPTION: Places a magenta line segment connecting (19, 83) to (484, 100).
; PLAN: r0=19(x1), r1=83(y1), r2=484(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 83
LDI r2, 484
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
