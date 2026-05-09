; DESCRIPTION: Places a red line segment connecting (321, 58) to (360, 216).
; PLAN: r0=321(x1), r1=58(y1), r2=360(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 58
LDI r2, 360
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
