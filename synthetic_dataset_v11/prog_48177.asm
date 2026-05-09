; DESCRIPTION: Renders a red line between points (116, 141) and (4, 118).
; PLAN: r0=116(x1), r1=141(y1), r2=4(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 141
LDI r2, 4
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
