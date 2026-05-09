; DESCRIPTION: Renders a red line between points (343, 199) and (63, 169).
; PLAN: r0=343(x1), r1=199(y1), r2=63(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 199
LDI r2, 63
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
