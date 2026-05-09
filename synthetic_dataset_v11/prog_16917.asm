; DESCRIPTION: Places a red line segment connecting (34, 97) to (17, 161).
; PLAN: r0=34(x1), r1=97(y1), r2=17(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 97
LDI r2, 17
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
