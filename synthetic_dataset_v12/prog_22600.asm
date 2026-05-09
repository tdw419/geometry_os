; DESCRIPTION: Places a magenta line segment connecting (34, 216) to (400, 49).
; PLAN: r0=34(x1), r1=216(y1), r2=400(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 216
LDI r2, 400
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
