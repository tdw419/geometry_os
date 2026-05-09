; DESCRIPTION: Places a red line segment connecting (301, 238) to (46, 137).
; PLAN: r0=301(x1), r1=238(y1), r2=46(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 238
LDI r2, 46
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
