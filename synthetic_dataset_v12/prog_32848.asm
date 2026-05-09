; DESCRIPTION: Places a magenta line segment connecting (334, 77) to (366, 94).
; PLAN: r0=334(x1), r1=77(y1), r2=366(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 77
LDI r2, 366
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
