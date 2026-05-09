; DESCRIPTION: Renders a red line between points (50, 89) and (99, 74).
; PLAN: r0=50(x1), r1=89(y1), r2=99(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 89
LDI r2, 99
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
