; DESCRIPTION: Renders a red line between points (127, 143) and (125, 245).
; PLAN: r0=127(x1), r1=143(y1), r2=125(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 143
LDI r2, 125
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
