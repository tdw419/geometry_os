; DESCRIPTION: Places a yellow line segment connecting (158, 7) to (93, 193).
; PLAN: r0=158(x1), r1=7(y1), r2=93(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 7
LDI r2, 93
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
