; DESCRIPTION: Renders a red line between points (140, 250) and (286, 34).
; PLAN: r0=140(x1), r1=250(y1), r2=286(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 250
LDI r2, 286
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
