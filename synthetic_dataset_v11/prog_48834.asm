; DESCRIPTION: Renders a red line between points (172, 122) and (20, 216).
; PLAN: r0=172(x1), r1=122(y1), r2=20(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 122
LDI r2, 20
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
