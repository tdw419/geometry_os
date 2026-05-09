; DESCRIPTION: Renders a red line between points (241, 136) and (70, 20).
; PLAN: r0=241(x1), r1=136(y1), r2=70(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 136
LDI r2, 70
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
