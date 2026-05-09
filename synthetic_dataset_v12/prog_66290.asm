; DESCRIPTION: Places a red line segment connecting (301, 91) to (121, 130).
; PLAN: r0=301(x1), r1=91(y1), r2=121(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 91
LDI r2, 121
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
