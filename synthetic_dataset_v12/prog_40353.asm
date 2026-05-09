; DESCRIPTION: Places a red line segment connecting (62, 194) to (261, 1).
; PLAN: r0=62(x1), r1=194(y1), r2=261(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 194
LDI r2, 261
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
