; DESCRIPTION: Places a blue line segment connecting (231, 216) to (185, 28).
; PLAN: r0=231(x1), r1=216(y1), r2=185(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 216
LDI r2, 185
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
