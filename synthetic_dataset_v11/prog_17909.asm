; DESCRIPTION: Renders a red line between points (183, 156) and (79, 156).
; PLAN: r0=183(x1), r1=156(y1), r2=79(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 156
LDI r2, 79
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
