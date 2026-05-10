; DESCRIPTION: Places a red line segment connecting (101, 184) to (91, 79).
; PLAN: r0=101(x1), r1=184(y1), r2=91(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 184
LDI r2, 91
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
