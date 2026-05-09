; DESCRIPTION: Renders a red line between points (221, 151) and (98, 158).
; PLAN: r0=221(x1), r1=151(y1), r2=98(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 151
LDI r2, 98
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
