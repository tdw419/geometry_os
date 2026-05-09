; DESCRIPTION: Renders a red line between points (79, 84) and (99, 92).
; PLAN: r0=79(x1), r1=84(y1), r2=99(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 84
LDI r2, 99
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
