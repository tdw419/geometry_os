; DESCRIPTION: Renders a blue line between points (102, 190) and (245, 79).
; PLAN: r0=102(x1), r1=190(y1), r2=245(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 190
LDI r2, 245
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
