; DESCRIPTION: Renders a red line between points (207, 119) and (188, 54).
; PLAN: r0=207(x1), r1=119(y1), r2=188(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 119
LDI r2, 188
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
