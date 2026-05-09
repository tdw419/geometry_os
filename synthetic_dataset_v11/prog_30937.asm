; DESCRIPTION: Renders a red line between points (15, 12) and (89, 95).
; PLAN: r0=15(x1), r1=12(y1), r2=89(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 12
LDI r2, 89
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
