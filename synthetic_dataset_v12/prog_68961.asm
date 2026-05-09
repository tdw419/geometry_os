; DESCRIPTION: Renders a blue line between points (145, 190) and (115, 205).
; PLAN: r0=145(x1), r1=190(y1), r2=115(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 190
LDI r2, 115
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
