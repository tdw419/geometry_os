; DESCRIPTION: Places a red line segment connecting (54, 139) to (80, 193).
; PLAN: r0=54(x1), r1=139(y1), r2=80(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 139
LDI r2, 80
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
