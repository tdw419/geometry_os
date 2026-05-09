; DESCRIPTION: Renders a red line between points (273, 251) and (100, 206).
; PLAN: r0=273(x1), r1=251(y1), r2=100(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 251
LDI r2, 100
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
