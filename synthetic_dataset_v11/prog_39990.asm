; DESCRIPTION: Places a magenta line segment connecting (89, 29) to (84, 170).
; PLAN: r0=89(x1), r1=29(y1), r2=84(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 29
LDI r2, 84
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
