; DESCRIPTION: Places a black line segment connecting (40, 131) to (158, 194).
; PLAN: r0=40(x1), r1=131(y1), r2=158(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 131
LDI r2, 158
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
