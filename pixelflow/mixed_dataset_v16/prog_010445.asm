; DESCRIPTION: Renders a red line segment connecting (276, 101) to (153, 99).
; PLAN: r0=276(x1), r1=101(y1), r2=153(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 101
LDI r2, 153
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
