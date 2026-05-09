; DESCRIPTION: Places a red line segment connecting (158, 93) to (414, 73).
; PLAN: r0=158(x1), r1=93(y1), r2=414(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 93
LDI r2, 414
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
