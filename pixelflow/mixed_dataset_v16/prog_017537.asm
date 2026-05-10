; DESCRIPTION: Places a red line segment connecting (510, 6) to (413, 229).
; PLAN: r0=510(x1), r1=6(y1), r2=413(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 6
LDI r2, 413
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
