; DESCRIPTION: Places a red line segment connecting (335, 124) to (472, 133).
; PLAN: r0=335(x1), r1=124(y1), r2=472(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 124
LDI r2, 472
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
