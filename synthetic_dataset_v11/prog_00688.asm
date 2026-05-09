; DESCRIPTION: Places a red line segment connecting (110, 68) to (36, 50).
; PLAN: r0=110(x1), r1=68(y1), r2=36(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 68
LDI r2, 36
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
