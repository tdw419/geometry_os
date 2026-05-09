; DESCRIPTION: Places a red line segment connecting (184, 145) to (296, 106).
; PLAN: r0=184(x1), r1=145(y1), r2=296(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 145
LDI r2, 296
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
