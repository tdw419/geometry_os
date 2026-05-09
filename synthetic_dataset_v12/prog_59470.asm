; DESCRIPTION: Renders a red line between points (68, 123) and (161, 3).
; PLAN: r0=68(x1), r1=123(y1), r2=161(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 123
LDI r2, 161
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
