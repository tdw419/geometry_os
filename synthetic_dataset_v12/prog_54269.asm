; DESCRIPTION: Renders a red line between points (410, 251) and (112, 118).
; PLAN: r0=410(x1), r1=251(y1), r2=112(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 251
LDI r2, 112
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
