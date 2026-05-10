; DESCRIPTION: Places a red line segment connecting (133, 139) to (244, 231).
; PLAN: r0=133(x1), r1=139(y1), r2=244(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 139
LDI r2, 244
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
