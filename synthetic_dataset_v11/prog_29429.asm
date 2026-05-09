; DESCRIPTION: Renders a red line between points (155, 20) and (57, 246).
; PLAN: r0=155(x1), r1=20(y1), r2=57(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 20
LDI r2, 57
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
