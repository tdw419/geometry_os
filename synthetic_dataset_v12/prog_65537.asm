; DESCRIPTION: Renders a red line between points (93, 111) and (316, 52).
; PLAN: r0=93(x1), r1=111(y1), r2=316(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 111
LDI r2, 316
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
