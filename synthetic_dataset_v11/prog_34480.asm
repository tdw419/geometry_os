; DESCRIPTION: Renders a red line between points (170, 155) and (146, 25).
; PLAN: r0=170(x1), r1=155(y1), r2=146(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 155
LDI r2, 146
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
