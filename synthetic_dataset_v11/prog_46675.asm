; DESCRIPTION: Places a blue line segment connecting (252, 68) to (94, 140).
; PLAN: r0=252(x1), r1=68(y1), r2=94(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 68
LDI r2, 94
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
