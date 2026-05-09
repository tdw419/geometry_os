; DESCRIPTION: Places a red line segment connecting (170, 200) to (118, 102).
; PLAN: r0=170(x1), r1=200(y1), r2=118(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 200
LDI r2, 118
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
