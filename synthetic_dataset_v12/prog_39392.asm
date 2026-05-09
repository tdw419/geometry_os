; DESCRIPTION: Renders a blue line between points (156, 82) and (378, 169).
; PLAN: r0=156(x1), r1=82(y1), r2=378(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 82
LDI r2, 378
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
