; DESCRIPTION: Renders a red line between points (424, 232) and (93, 167).
; PLAN: r0=424(x1), r1=232(y1), r2=93(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 232
LDI r2, 93
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
