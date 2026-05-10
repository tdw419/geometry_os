; DESCRIPTION: Renders a red line between points (470, 246) and (318, 57).
; PLAN: r0=470(x1), r1=246(y1), r2=318(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 246
LDI r2, 318
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
