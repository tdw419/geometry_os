; DESCRIPTION: Renders a red line between points (455, 147) and (118, 104).
; PLAN: r0=455(x1), r1=147(y1), r2=118(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 147
LDI r2, 118
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
