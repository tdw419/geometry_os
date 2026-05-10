; DESCRIPTION: Renders a red line between points (73, 101) and (289, 102).
; PLAN: r0=73(x1), r1=101(y1), r2=289(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 101
LDI r2, 289
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
