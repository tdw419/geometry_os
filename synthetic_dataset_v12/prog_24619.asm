; DESCRIPTION: Places a red line segment connecting (408, 115) to (472, 108).
; PLAN: r0=408(x1), r1=115(y1), r2=472(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 115
LDI r2, 472
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
