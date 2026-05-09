; DESCRIPTION: Places a red line segment connecting (49, 99) to (484, 92).
; PLAN: r0=49(x1), r1=99(y1), r2=484(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 99
LDI r2, 484
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
