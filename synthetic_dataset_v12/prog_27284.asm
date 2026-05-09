; DESCRIPTION: Places a yellow line segment connecting (505, 91) to (423, 216).
; PLAN: r0=505(x1), r1=91(y1), r2=423(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 91
LDI r2, 423
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
