; DESCRIPTION: Places a red line segment connecting (335, 9) to (276, 52).
; PLAN: r0=335(x1), r1=9(y1), r2=276(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 9
LDI r2, 276
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
