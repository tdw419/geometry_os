; DESCRIPTION: Renders a red line between points (136, 231) and (105, 106).
; PLAN: r0=136(x1), r1=231(y1), r2=105(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 231
LDI r2, 105
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
