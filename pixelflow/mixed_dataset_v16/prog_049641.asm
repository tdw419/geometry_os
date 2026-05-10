; DESCRIPTION: Renders a red line between points (88, 45) and (262, 247).
; PLAN: r0=88(x1), r1=45(y1), r2=262(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 45
LDI r2, 262
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
