; DESCRIPTION: Renders a red line between points (149, 106) and (116, 7).
; PLAN: r0=149(x1), r1=106(y1), r2=116(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 106
LDI r2, 116
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
