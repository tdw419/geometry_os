; DESCRIPTION: Renders a red line between points (65, 116) and (297, 91).
; PLAN: r0=65(x1), r1=116(y1), r2=297(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 116
LDI r2, 297
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
