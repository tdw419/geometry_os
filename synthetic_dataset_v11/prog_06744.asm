; DESCRIPTION: Places a red line segment connecting (8, 200) to (186, 131).
; PLAN: r0=8(x1), r1=200(y1), r2=186(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 200
LDI r2, 186
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
