; DESCRIPTION: Places a red line segment connecting (20, 50) to (471, 216).
; PLAN: r0=20(x1), r1=50(y1), r2=471(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 50
LDI r2, 471
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
