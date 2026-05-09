; DESCRIPTION: Renders a red line between points (500, 65) and (40, 79).
; PLAN: r0=500(x1), r1=65(y1), r2=40(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 65
LDI r2, 40
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
