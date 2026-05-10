; DESCRIPTION: Renders a red line between points (66, 4) and (151, 158).
; PLAN: r0=66(x1), r1=4(y1), r2=151(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 4
LDI r2, 151
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
