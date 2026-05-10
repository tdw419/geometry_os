; DESCRIPTION: Places a red line segment connecting (89, 184) to (150, 218).
; PLAN: r0=89(x1), r1=184(y1), r2=150(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 184
LDI r2, 150
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
