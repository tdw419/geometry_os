; DESCRIPTION: Renders a red line between points (264, 85) and (68, 79).
; PLAN: r0=264(x1), r1=85(y1), r2=68(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 85
LDI r2, 68
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
