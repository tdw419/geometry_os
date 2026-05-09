; DESCRIPTION: Renders a red line between points (153, 155) and (26, 29).
; PLAN: r0=153(x1), r1=155(y1), r2=26(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 155
LDI r2, 26
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
