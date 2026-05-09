; DESCRIPTION: Places a blue line segment connecting (147, 57) to (26, 67).
; PLAN: r0=147(x1), r1=57(y1), r2=26(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 57
LDI r2, 26
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
