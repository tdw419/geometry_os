; DESCRIPTION: Places a red line segment connecting (99, 123) to (100, 169).
; PLAN: r0=99(x1), r1=123(y1), r2=100(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 123
LDI r2, 100
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
