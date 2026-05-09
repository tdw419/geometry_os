; DESCRIPTION: Places a red line segment connecting (61, 158) to (293, 102).
; PLAN: r0=61(x1), r1=158(y1), r2=293(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 158
LDI r2, 293
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
