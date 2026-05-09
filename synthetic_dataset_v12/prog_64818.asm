; DESCRIPTION: Renders a orange line between points (472, 190) and (96, 163).
; PLAN: r0=472(x1), r1=190(y1), r2=96(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 190
LDI r2, 96
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
