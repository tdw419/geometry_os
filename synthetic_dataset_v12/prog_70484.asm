; DESCRIPTION: Places a red line segment connecting (484, 166) to (218, 102).
; PLAN: r0=484(x1), r1=166(y1), r2=218(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 166
LDI r2, 218
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
