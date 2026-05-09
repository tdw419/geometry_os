; DESCRIPTION: Places a red line segment connecting (369, 140) to (337, 106).
; PLAN: r0=369(x1), r1=140(y1), r2=337(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 140
LDI r2, 337
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
