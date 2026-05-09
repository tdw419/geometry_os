; DESCRIPTION: Renders a blue line between points (203, 190) and (6, 143).
; PLAN: r0=203(x1), r1=190(y1), r2=6(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 190
LDI r2, 6
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
