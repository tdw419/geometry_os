; DESCRIPTION: Renders a red line between points (108, 203) and (35, 162).
; PLAN: r0=108(x1), r1=203(y1), r2=35(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 203
LDI r2, 35
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
