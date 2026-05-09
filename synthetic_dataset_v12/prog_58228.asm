; DESCRIPTION: Places a red line segment connecting (339, 8) to (419, 118).
; PLAN: r0=339(x1), r1=8(y1), r2=419(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 8
LDI r2, 419
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
