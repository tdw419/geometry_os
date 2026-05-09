; DESCRIPTION: Renders a red line between points (30, 146) and (54, 190).
; PLAN: r0=30(x1), r1=146(y1), r2=54(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 146
LDI r2, 54
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
