; DESCRIPTION: Places a red line segment connecting (179, 179) to (472, 161).
; PLAN: r0=179(x1), r1=179(y1), r2=472(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 179
LDI r2, 472
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
