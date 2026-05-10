; DESCRIPTION: Places a magenta line segment connecting (119, 110) to (473, 62).
; PLAN: r0=119(x1), r1=110(y1), r2=473(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 110
LDI r2, 473
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
