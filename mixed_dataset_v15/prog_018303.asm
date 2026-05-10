; DESCRIPTION: Places a red line segment connecting (199, 95) to (264, 9).
; PLAN: r0=199(x1), r1=95(y1), r2=264(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 95
LDI r2, 264
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
