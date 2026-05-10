; DESCRIPTION: Renders a red line segment connecting (251, 24) to (101, 93).
; PLAN: r0=251(x1), r1=24(y1), r2=101(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 24
LDI r2, 101
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
