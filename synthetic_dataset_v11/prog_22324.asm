; DESCRIPTION: Places a red line segment connecting (102, 81) to (90, 99).
; PLAN: r0=102(x1), r1=81(y1), r2=90(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 81
LDI r2, 90
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
