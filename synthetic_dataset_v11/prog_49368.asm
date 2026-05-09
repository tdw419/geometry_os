; DESCRIPTION: Places a red line segment connecting (232, 155) to (1, 216).
; PLAN: r0=232(x1), r1=155(y1), r2=1(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 155
LDI r2, 1
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
