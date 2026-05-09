; DESCRIPTION: Renders a red line between points (190, 66) and (145, 191).
; PLAN: r0=190(x1), r1=66(y1), r2=145(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 66
LDI r2, 145
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
