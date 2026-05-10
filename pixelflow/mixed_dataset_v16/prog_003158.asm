; DESCRIPTION: Places a blue line segment connecting (287, 110) to (302, 30).
; PLAN: r0=287(x1), r1=110(y1), r2=302(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 110
LDI r2, 302
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
