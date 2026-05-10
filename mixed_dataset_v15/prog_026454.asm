; DESCRIPTION: Renders a orange line between points (80, 44) and (190, 38).
; PLAN: r0=80(x1), r1=44(y1), r2=190(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 44
LDI r2, 190
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
