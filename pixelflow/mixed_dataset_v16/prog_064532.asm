; DESCRIPTION: Places a red line segment connecting (286, 3) to (501, 34).
; PLAN: r0=286(x1), r1=3(y1), r2=501(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 3
LDI r2, 501
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
