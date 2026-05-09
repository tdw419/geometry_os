; DESCRIPTION: Places a red line segment connecting (241, 61) to (116, 78).
; PLAN: r0=241(x1), r1=61(y1), r2=116(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 61
LDI r2, 116
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
