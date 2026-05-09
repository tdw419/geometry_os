; DESCRIPTION: Places a red line segment connecting (474, 13) to (140, 158).
; PLAN: r0=474(x1), r1=13(y1), r2=140(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 13
LDI r2, 140
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
