; DESCRIPTION: Renders a red line between points (190, 110) and (485, 73).
; PLAN: r0=190(x1), r1=110(y1), r2=485(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 110
LDI r2, 485
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
