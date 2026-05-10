; DESCRIPTION: Renders a red line between points (162, 70) and (158, 176).
; PLAN: r0=162(x1), r1=70(y1), r2=158(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 70
LDI r2, 158
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
