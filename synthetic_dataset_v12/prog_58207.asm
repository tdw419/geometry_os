; DESCRIPTION: Draws a red line from (297, 156) to (238, 93).
; PLAN: r0=297(x1), r1=156(y1), r2=238(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 156
LDI r2, 238
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
