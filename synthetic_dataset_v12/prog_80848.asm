; DESCRIPTION: Places a red line segment connecting (15, 49) to (200, 131).
; PLAN: r0=15(x1), r1=49(y1), r2=200(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 49
LDI r2, 200
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
