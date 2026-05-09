; DESCRIPTION: Places a red line segment connecting (99, 180) to (335, 194).
; PLAN: r0=99(x1), r1=180(y1), r2=335(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 180
LDI r2, 335
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
