; DESCRIPTION: Renders a red line between points (241, 71) and (14, 167).
; PLAN: r0=241(x1), r1=71(y1), r2=14(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 71
LDI r2, 14
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
