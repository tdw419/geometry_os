; DESCRIPTION: Places a red line segment connecting (10, 169) to (396, 70).
; PLAN: r0=10(x1), r1=169(y1), r2=396(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 169
LDI r2, 396
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
