; DESCRIPTION: Places a red line segment connecting (199, 24) to (149, 20).
; PLAN: r0=199(x1), r1=24(y1), r2=149(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 24
LDI r2, 149
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
