; DESCRIPTION: Renders a orange line between points (190, 113) and (189, 98).
; PLAN: r0=190(x1), r1=113(y1), r2=189(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 113
LDI r2, 189
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
