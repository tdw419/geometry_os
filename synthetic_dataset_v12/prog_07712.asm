; DESCRIPTION: Renders a magenta line between points (318, 75) and (26, 75).
; PLAN: r0=318(x1), r1=75(y1), r2=26(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 75
LDI r2, 26
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
