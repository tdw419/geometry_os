; DESCRIPTION: Renders a red line between points (273, 107) and (139, 155).
; PLAN: r0=273(x1), r1=107(y1), r2=139(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 107
LDI r2, 139
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
