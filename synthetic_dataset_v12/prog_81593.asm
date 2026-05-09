; DESCRIPTION: Places a red line segment connecting (158, 122) to (509, 123).
; PLAN: r0=158(x1), r1=122(y1), r2=509(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 122
LDI r2, 509
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
