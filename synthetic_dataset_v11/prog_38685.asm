; DESCRIPTION: Places a red line segment connecting (218, 118) to (121, 11).
; PLAN: r0=218(x1), r1=118(y1), r2=121(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 118
LDI r2, 121
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
