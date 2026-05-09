; DESCRIPTION: Places a red line segment connecting (473, 71) to (447, 238).
; PLAN: r0=473(x1), r1=71(y1), r2=447(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 71
LDI r2, 447
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
