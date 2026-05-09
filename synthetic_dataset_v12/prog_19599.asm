; DESCRIPTION: Renders a red line between points (390, 190) and (193, 180).
; PLAN: r0=390(x1), r1=190(y1), r2=193(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 190
LDI r2, 193
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
