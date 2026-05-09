; DESCRIPTION: Renders a red line between points (2, 76) and (186, 94).
; PLAN: r0=2(x1), r1=76(y1), r2=186(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 76
LDI r2, 186
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
