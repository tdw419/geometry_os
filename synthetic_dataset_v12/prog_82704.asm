; DESCRIPTION: Places a white line segment connecting (158, 6) to (368, 102).
; PLAN: r0=158(x1), r1=6(y1), r2=368(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 6
LDI r2, 368
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
