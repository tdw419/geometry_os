; DESCRIPTION: Places a red line segment connecting (17, 227) to (65, 205).
; PLAN: r0=17(x1), r1=227(y1), r2=65(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 227
LDI r2, 65
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
