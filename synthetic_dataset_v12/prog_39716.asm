; DESCRIPTION: Renders a red line between points (226, 119) and (391, 185).
; PLAN: r0=226(x1), r1=119(y1), r2=391(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 119
LDI r2, 391
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
