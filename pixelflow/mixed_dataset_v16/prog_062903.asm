; DESCRIPTION: Renders a red line between points (233, 75) and (163, 236).
; PLAN: r0=233(x1), r1=75(y1), r2=163(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 75
LDI r2, 163
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
