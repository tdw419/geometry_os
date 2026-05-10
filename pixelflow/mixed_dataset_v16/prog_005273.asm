; DESCRIPTION: Renders a red line between points (466, 14) and (111, 170).
; PLAN: r0=466(x1), r1=14(y1), r2=111(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 14
LDI r2, 111
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
