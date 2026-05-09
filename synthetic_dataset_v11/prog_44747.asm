; DESCRIPTION: Renders a red line between points (25, 246) and (144, 1).
; PLAN: r0=25(x1), r1=246(y1), r2=144(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 246
LDI r2, 144
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
