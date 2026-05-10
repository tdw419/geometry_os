; DESCRIPTION: Renders a purple line between points (190, 146) and (306, 119).
; PLAN: r0=190(x1), r1=146(y1), r2=306(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 146
LDI r2, 306
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
