; DESCRIPTION: Renders a orange line between points (93, 138) and (482, 182).
; PLAN: r0=93(x1), r1=138(y1), r2=482(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 138
LDI r2, 482
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
