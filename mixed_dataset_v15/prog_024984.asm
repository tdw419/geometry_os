; DESCRIPTION: Places a yellow line segment connecting (507, 6) to (486, 110).
; PLAN: r0=507(x1), r1=6(y1), r2=486(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 6
LDI r2, 486
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
