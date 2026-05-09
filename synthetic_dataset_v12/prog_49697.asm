; DESCRIPTION: Places a red line segment connecting (452, 217) to (138, 169).
; PLAN: r0=452(x1), r1=217(y1), r2=138(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 217
LDI r2, 138
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
