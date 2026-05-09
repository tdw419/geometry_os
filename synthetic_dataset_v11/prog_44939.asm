; DESCRIPTION: Renders a red line between points (186, 99) and (74, 214).
; PLAN: r0=186(x1), r1=99(y1), r2=74(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 99
LDI r2, 74
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
