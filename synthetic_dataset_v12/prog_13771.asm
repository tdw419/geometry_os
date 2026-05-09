; DESCRIPTION: Places a red line segment connecting (23, 20) to (509, 118).
; PLAN: r0=23(x1), r1=20(y1), r2=509(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 20
LDI r2, 509
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
