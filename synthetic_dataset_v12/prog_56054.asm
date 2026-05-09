; DESCRIPTION: Renders a red line between points (149, 212) and (485, 162).
; PLAN: r0=149(x1), r1=212(y1), r2=485(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 212
LDI r2, 485
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
