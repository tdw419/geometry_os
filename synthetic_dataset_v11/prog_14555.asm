; DESCRIPTION: Renders a red line between points (118, 124) and (108, 162).
; PLAN: r0=118(x1), r1=124(y1), r2=108(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 124
LDI r2, 108
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
