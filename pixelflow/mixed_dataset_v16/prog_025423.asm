; DESCRIPTION: Renders a red line between points (236, 136) and (359, 149).
; PLAN: r0=236(x1), r1=136(y1), r2=359(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 136
LDI r2, 359
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
