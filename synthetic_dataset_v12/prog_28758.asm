; DESCRIPTION: Renders a magenta line between points (163, 95) and (143, 109).
; PLAN: r0=163(x1), r1=95(y1), r2=143(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 95
LDI r2, 143
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
