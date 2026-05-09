; DESCRIPTION: Renders a red line between points (501, 136) and (136, 74).
; PLAN: r0=501(x1), r1=136(y1), r2=136(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 136
LDI r2, 136
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
