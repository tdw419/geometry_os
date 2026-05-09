; DESCRIPTION: Draws a red line from (190, 47) to (80, 66).
; PLAN: r0=190(x1), r1=47(y1), r2=80(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 47
LDI r2, 80
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
