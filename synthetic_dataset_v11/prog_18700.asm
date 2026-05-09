; DESCRIPTION: Places a blue line segment connecting (37, 28) to (212, 22).
; PLAN: r0=37(x1), r1=28(y1), r2=212(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 28
LDI r2, 212
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
