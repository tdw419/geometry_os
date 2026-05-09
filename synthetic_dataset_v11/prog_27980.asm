; DESCRIPTION: Renders a red line between points (214, 110) and (177, 93).
; PLAN: r0=214(x1), r1=110(y1), r2=177(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 110
LDI r2, 177
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
