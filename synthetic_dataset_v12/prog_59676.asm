; DESCRIPTION: Places a red line segment connecting (486, 162) to (118, 199).
; PLAN: r0=486(x1), r1=162(y1), r2=118(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 162
LDI r2, 118
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
