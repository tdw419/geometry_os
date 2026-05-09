; DESCRIPTION: Renders a red line between points (93, 214) and (22, 123).
; PLAN: r0=93(x1), r1=214(y1), r2=22(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 214
LDI r2, 22
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
