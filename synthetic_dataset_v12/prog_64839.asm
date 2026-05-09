; DESCRIPTION: Places a red line segment connecting (4, 88) to (314, 218).
; PLAN: r0=4(x1), r1=88(y1), r2=314(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 88
LDI r2, 314
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
