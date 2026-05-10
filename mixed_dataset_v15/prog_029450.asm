; DESCRIPTION: Places a red line segment connecting (72, 89) to (303, 104).
; PLAN: r0=72(x1), r1=89(y1), r2=303(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 89
LDI r2, 303
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
