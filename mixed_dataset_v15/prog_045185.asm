; DESCRIPTION: Places a yellow line segment connecting (200, 252) to (20, 110).
; PLAN: r0=200(x1), r1=252(y1), r2=20(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 252
LDI r2, 20
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
