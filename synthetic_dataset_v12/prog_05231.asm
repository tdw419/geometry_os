; DESCRIPTION: Renders a orange line between points (395, 139) and (404, 85).
; PLAN: r0=395(x1), r1=139(y1), r2=404(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 139
LDI r2, 404
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
