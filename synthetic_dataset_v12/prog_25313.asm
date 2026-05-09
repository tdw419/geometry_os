; DESCRIPTION: Places a red line segment connecting (213, 162) to (93, 123).
; PLAN: r0=213(x1), r1=162(y1), r2=93(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 162
LDI r2, 93
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
