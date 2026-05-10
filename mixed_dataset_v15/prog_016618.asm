; DESCRIPTION: Places a red line segment connecting (348, 229) to (21, 140).
; PLAN: r0=348(x1), r1=229(y1), r2=21(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 229
LDI r2, 21
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
