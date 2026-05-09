; DESCRIPTION: Places a red line segment connecting (288, 23) to (484, 58).
; PLAN: r0=288(x1), r1=23(y1), r2=484(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 23
LDI r2, 484
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
