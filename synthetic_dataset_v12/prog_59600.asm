; DESCRIPTION: Renders a red line between points (315, 154) and (323, 127).
; PLAN: r0=315(x1), r1=154(y1), r2=323(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 154
LDI r2, 323
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
