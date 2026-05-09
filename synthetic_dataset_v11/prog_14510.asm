; DESCRIPTION: Renders a red line between points (93, 45) and (36, 191).
; PLAN: r0=93(x1), r1=45(y1), r2=36(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 45
LDI r2, 36
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
