; DESCRIPTION: Places a red line segment connecting (158, 23) to (215, 102).
; PLAN: r0=158(x1), r1=23(y1), r2=215(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 23
LDI r2, 215
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
