; DESCRIPTION: Places a red line segment connecting (222, 118) to (163, 29).
; PLAN: r0=222(x1), r1=118(y1), r2=163(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 118
LDI r2, 163
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
