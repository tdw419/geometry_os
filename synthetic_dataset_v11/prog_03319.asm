; DESCRIPTION: Renders a red line between points (156, 50) and (35, 169).
; PLAN: r0=156(x1), r1=50(y1), r2=35(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 50
LDI r2, 35
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
