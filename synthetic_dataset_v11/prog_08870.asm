; DESCRIPTION: Renders a red line between points (252, 156) and (238, 190).
; PLAN: r0=252(x1), r1=156(y1), r2=238(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 156
LDI r2, 238
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
