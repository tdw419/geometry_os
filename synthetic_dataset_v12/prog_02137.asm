; DESCRIPTION: Places a red line segment connecting (389, 101) to (379, 79).
; PLAN: r0=389(x1), r1=101(y1), r2=379(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 101
LDI r2, 379
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
