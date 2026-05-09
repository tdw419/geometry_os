; DESCRIPTION: Renders a red line between points (197, 217) and (155, 198).
; PLAN: r0=197(x1), r1=217(y1), r2=155(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 217
LDI r2, 155
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
