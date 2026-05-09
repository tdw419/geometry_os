; DESCRIPTION: Places a red line segment connecting (15, 155) to (231, 98).
; PLAN: r0=15(x1), r1=155(y1), r2=231(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 155
LDI r2, 231
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
