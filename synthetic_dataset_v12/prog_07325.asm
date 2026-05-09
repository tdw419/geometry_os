; DESCRIPTION: Renders a red line between points (136, 60) and (246, 94).
; PLAN: r0=136(x1), r1=60(y1), r2=246(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 60
LDI r2, 246
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
