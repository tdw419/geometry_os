; DESCRIPTION: Renders a red line between points (116, 123) and (457, 30).
; PLAN: r0=116(x1), r1=123(y1), r2=457(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 123
LDI r2, 457
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
