; DESCRIPTION: Places a magenta line segment connecting (8, 122) to (89, 7).
; PLAN: r0=8(x1), r1=122(y1), r2=89(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 122
LDI r2, 89
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
