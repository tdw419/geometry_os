; DESCRIPTION: Places a red line segment connecting (416, 182) to (161, 78).
; PLAN: r0=416(x1), r1=182(y1), r2=161(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 182
LDI r2, 161
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
