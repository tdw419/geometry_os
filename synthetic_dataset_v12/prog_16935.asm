; DESCRIPTION: Places a red line segment connecting (501, 100) to (123, 231).
; PLAN: r0=501(x1), r1=100(y1), r2=123(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 100
LDI r2, 123
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
