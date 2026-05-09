; DESCRIPTION: Places a red line segment connecting (259, 250) to (122, 194).
; PLAN: r0=259(x1), r1=250(y1), r2=122(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 250
LDI r2, 122
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
