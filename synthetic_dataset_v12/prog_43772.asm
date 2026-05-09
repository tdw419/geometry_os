; DESCRIPTION: Draws a red line from (47, 190) to (500, 5).
; PLAN: r0=47(x1), r1=190(y1), r2=500(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 190
LDI r2, 500
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
