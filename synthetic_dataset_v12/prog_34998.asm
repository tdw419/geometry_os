; DESCRIPTION: Places a red line segment connecting (259, 91) to (287, 208).
; PLAN: r0=259(x1), r1=91(y1), r2=287(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 91
LDI r2, 287
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
