; DESCRIPTION: Renders a orange line between points (161, 145) and (89, 190).
; PLAN: r0=161(x1), r1=145(y1), r2=89(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 145
LDI r2, 89
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
