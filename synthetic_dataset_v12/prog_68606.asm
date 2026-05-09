; DESCRIPTION: Places a red line segment connecting (462, 168) to (43, 80).
; PLAN: r0=462(x1), r1=168(y1), r2=43(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 168
LDI r2, 43
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
