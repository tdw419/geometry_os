; DESCRIPTION: Renders a red line between points (367, 156) and (233, 127).
; PLAN: r0=367(x1), r1=156(y1), r2=233(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 156
LDI r2, 233
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
