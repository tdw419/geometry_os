; DESCRIPTION: Places a red line segment connecting (443, 89) to (47, 110).
; PLAN: r0=443(x1), r1=89(y1), r2=47(x2), r3=110(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 89
LDI r2, 47
LDI r3, 110
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
