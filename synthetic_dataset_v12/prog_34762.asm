; DESCRIPTION: Renders a red line between points (183, 169) and (276, 34).
; PLAN: r0=183(x1), r1=169(y1), r2=276(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 169
LDI r2, 276
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
