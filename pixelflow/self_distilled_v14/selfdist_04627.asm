; DESCRIPTION: Renders a yellow line segment connecting (158, 116) to (74, 1).
; PLAN: r0=158(x1), r1=116(y1), r2=74(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 116
LDI r2, 74
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
