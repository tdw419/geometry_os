; DESCRIPTION: Places a red line segment connecting (353, 110) to (335, 28).
; PLAN: r0=353(x1), r1=110(y1), r2=335(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 110
LDI r2, 335
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
