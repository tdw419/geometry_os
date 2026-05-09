; DESCRIPTION: Draws a red line from (30, 113) to (190, 205).
; PLAN: r0=30(x1), r1=113(y1), r2=190(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 113
LDI r2, 190
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
