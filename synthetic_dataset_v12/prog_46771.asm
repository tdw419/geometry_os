; DESCRIPTION: Places a red line segment connecting (76, 157) to (147, 208).
; PLAN: r0=76(x1), r1=157(y1), r2=147(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 157
LDI r2, 147
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
