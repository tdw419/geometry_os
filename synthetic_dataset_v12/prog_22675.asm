; DESCRIPTION: Places a red line segment connecting (432, 40) to (118, 255).
; PLAN: r0=432(x1), r1=40(y1), r2=118(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 40
LDI r2, 118
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
