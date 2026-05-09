; DESCRIPTION: Places a red line segment connecting (200, 161) to (34, 67).
; PLAN: r0=200(x1), r1=161(y1), r2=34(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 161
LDI r2, 34
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
