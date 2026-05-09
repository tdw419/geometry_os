; DESCRIPTION: Renders a red line between points (252, 30) and (227, 162).
; PLAN: r0=252(x1), r1=30(y1), r2=227(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 30
LDI r2, 227
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
