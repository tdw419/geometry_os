; DESCRIPTION: Renders a red line between points (17, 190) and (50, 52).
; PLAN: r0=17(x1), r1=190(y1), r2=50(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 190
LDI r2, 50
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
