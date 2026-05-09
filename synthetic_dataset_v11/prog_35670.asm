; DESCRIPTION: Places a blue line segment connecting (89, 148) to (0, 26).
; PLAN: r0=89(x1), r1=148(y1), r2=0(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 148
LDI r2, 0
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
