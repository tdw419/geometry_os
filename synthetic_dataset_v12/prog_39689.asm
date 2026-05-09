; DESCRIPTION: Places a red line segment connecting (335, 154) to (486, 237).
; PLAN: r0=335(x1), r1=154(y1), r2=486(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 154
LDI r2, 486
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
