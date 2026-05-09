; DESCRIPTION: Places a green line segment connecting (3, 118) to (508, 155).
; PLAN: r0=3(x1), r1=118(y1), r2=508(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 118
LDI r2, 508
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
