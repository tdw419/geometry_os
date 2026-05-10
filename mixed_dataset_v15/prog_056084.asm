; DESCRIPTION: Renders a red line between points (439, 167) and (232, 62).
; PLAN: r0=439(x1), r1=167(y1), r2=232(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 167
LDI r2, 232
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
