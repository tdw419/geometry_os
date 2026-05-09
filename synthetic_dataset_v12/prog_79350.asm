; DESCRIPTION: Renders a red line between points (43, 136) and (406, 115).
; PLAN: r0=43(x1), r1=136(y1), r2=406(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 136
LDI r2, 406
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
