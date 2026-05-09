; DESCRIPTION: Places a red line segment connecting (147, 131) to (505, 104).
; PLAN: r0=147(x1), r1=131(y1), r2=505(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 131
LDI r2, 505
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
