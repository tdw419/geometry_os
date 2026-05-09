; DESCRIPTION: Renders a red line between points (485, 134) and (339, 7).
; PLAN: r0=485(x1), r1=134(y1), r2=339(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 134
LDI r2, 339
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
