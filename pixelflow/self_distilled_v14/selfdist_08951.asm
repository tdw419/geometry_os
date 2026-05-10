; DESCRIPTION: Renders a red line segment connecting (247, 30) to (141, 15).
; PLAN: r0=247(x1), r1=30(y1), r2=141(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 30
LDI r2, 141
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
