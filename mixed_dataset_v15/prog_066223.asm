; DESCRIPTION: Places a red line segment connecting (184, 218) to (50, 77).
; PLAN: r0=184(x1), r1=218(y1), r2=50(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 218
LDI r2, 50
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
