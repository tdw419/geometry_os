; DESCRIPTION: Places a yellow line segment connecting (178, 89) to (200, 9).
; PLAN: r0=178(x1), r1=89(y1), r2=200(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 89
LDI r2, 200
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
