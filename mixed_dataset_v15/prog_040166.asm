; DESCRIPTION: Renders a red line segment connecting (55, 101) to (150, 1).
; PLAN: r0=55(x1), r1=101(y1), r2=150(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 101
LDI r2, 150
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
