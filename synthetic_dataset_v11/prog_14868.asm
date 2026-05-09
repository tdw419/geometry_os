; DESCRIPTION: Renders a orange line between points (120, 190) and (149, 132).
; PLAN: r0=120(x1), r1=190(y1), r2=149(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 190
LDI r2, 149
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
