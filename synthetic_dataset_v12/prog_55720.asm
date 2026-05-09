; DESCRIPTION: Renders a yellow line between points (153, 190) and (100, 106).
; PLAN: r0=153(x1), r1=190(y1), r2=100(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 190
LDI r2, 100
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
