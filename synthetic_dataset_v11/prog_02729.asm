; DESCRIPTION: Renders a red line between points (110, 52) and (24, 147).
; PLAN: r0=110(x1), r1=52(y1), r2=24(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 52
LDI r2, 24
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
